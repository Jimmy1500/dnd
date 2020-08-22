#include <random>

#include <string>
#include <sstream>
#include <cstring>

#include <iostream>

static std::random_device device{};
static std::mt19937_64 engine(device());

static int cast (const std::string& roll, long& min, long& max, long& sum, const long mod, long& total, char msg[]) {
    try {
        std::stringstream ss;
        size_t len = roll.length();

        auto pos( roll.find("d") );
        if (pos == std::string::npos) {
            ss << "invalid roll: " << roll;
            throw std::invalid_argument( ss.str() );
        }

        size_t n( std::stoi(roll.substr(0, pos)) );
        size_t N( std::stoi(roll.substr(pos + 1, len)) );
        std::uniform_int_distribution<long> dice(1, N);

        size_t i;
        for (i = 0; i < n; ++i) {
            auto value = dice(engine);
            if (value < min || !min ) { min = value; }
            if (value > max || !max ) { max = value; }
            std::cout << "roll " << (i+1) << ": " << value << std::endl;
            sum += value;
        }
        total = sum + mod;

        std::cout << "-----------" << std::endl;
        std::cout << "DICE: " << roll << std::endl;
        std::cout << "SUM: " << sum
            << "[MIN: " << min << ", MAX: " << max << "] "
            << (mod >= 0 ? "+" : "" ) << mod << " = "
            << total << std::endl;

        ss << sum << "[" << min << "," << max << "]" << (mod >= 0 ? "+" : "" ) << mod;
        strcpy( msg, ss.str().c_str() );

    } catch (std::invalid_argument const & e) {
        strcpy( msg, e.what() );
        return 1;
    }
    return 0;
}

#ifdef __cplusplus
extern "C" {
#endif

#include <gtk-3.0/gtk/gtk.h>

static GtkWidget *entry_dice;
static GtkWidget *entry_mod;
static GtkWidget *entry_sum;
static GtkWidget *entry_msg;

static void roll (GtkWidget *widget, gpointer data) {
    char* dice = (char *) gtk_entry_get_text (GTK_ENTRY(entry_dice));
    long mod = atof((char *) gtk_entry_get_text (GTK_ENTRY(entry_mod)));

    char msg_buffer[30];
    char sum_buffer[12];

    g_print ("### casting: %s\n", dice);
    long min( 0 ), max( 0 ), sum( 0 ), total( 0 ); 
    if ( !cast(dice, min, max, sum, mod, total, msg_buffer) ) {
        snprintf(sum_buffer, sizeof(sum_buffer), "%li", total);
    }
    g_print ("\n");

    gtk_entry_set_text(GTK_ENTRY(entry_msg), msg_buffer);
    gtk_entry_set_text(GTK_ENTRY(entry_sum), sum_buffer);
}

int main (int argc, char * argv[])
{
    GtkBuilder *builder;
    GtkWidget *window;
    GObject *button;
    GError *error = NULL;

    gtk_init (&argc, &argv);

    builder = gtk_builder_new();
    if ( !gtk_builder_add_from_file (builder, "../ui/dice.ui", &error) )
    {
        g_printerr ("Error loading file: %s\n", error->message);
        g_clear_error (&error);
        return 1;
    }

    window = (GtkWidget *)gtk_builder_get_object (builder, "window");
    g_signal_connect (window, "destroy", G_CALLBACK (gtk_main_quit), NULL); 

    entry_dice = (GtkWidget *)gtk_builder_get_object (builder, "entry_dice");
    entry_mod = (GtkWidget *)gtk_builder_get_object (builder, "entry_mod");
    entry_msg = (GtkWidget *)gtk_builder_get_object (builder, "entry_msg");
    entry_sum = (GtkWidget *)gtk_builder_get_object (builder, "entry_sum");

    button = gtk_builder_get_object (builder, "button_roll");
    g_signal_connect (button, "clicked", G_CALLBACK (roll), NULL);

    gtk_widget_show_all (window);
    gtk_main ();

    return 0;
}

#ifdef __cplusplus
}
#endif
