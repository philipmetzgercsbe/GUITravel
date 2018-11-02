using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Gui_Travel.ClassRepository;

namespace Gui_Travel
{
    /// <summary>
    /// Interaction logic for loginControl.xaml
    /// </summary>
    public partial class loginControl : UserControl
    {
        public loginControl()
        {

       
            InitializeComponent();
            

            //get DB Connection
            // usn == db.kunde && password = password ? show new Control : Display txtBox && pwBox as red
            //Create mockup / prototype thanks mr ammerschuber


        }

        private void Login(object sender, RoutedEventArgs e)
        {
            GUIUserRepository usercmds = new GUIUserRepository();
            string usn = UsnTxtbox.Text;
            string pw = PasswordBox.Password;
            usercmds.Verify(pw, usn) ? //Create Method to load || hide this  MainMenu : Display Fields as red with subtext pw or usn false

        }

        private void UsnTxtboxFocus(object sender, RoutedEventArgs e)
        {
           
                TextBox tb = (TextBox)sender;
                tb.Text = string.Empty;
                tb.GotFocus -= UsnTxtboxFocus;
            
        }

        private void PasswordBoxFocus(object sender, RoutedEventArgs e)
        {
            PasswordBox tb = (PasswordBox)sender;
            tb.Password = string.Empty;
            tb.GotFocus -= PasswordBoxFocus;
        }

        private void notRegistered(object sender, RoutedEventArgs e)
        {
            
            //Remove this from Panel and load registration 
        }
    }
}
