using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using Gui_Travel.ClassRepository;

namespace Gui_Travel
{
    /// <summary>
    /// Interaction logic for loginControl.xaml
    /// </summary>
    public partial class loginControl : UserControl
    {
        public static Kunde Kunde;
        
        public static M120Entities M120Entities = new M120Entities();
        public loginControl()
        {

       
            InitializeComponent();
            

            //get DB Connection
            // usn == db.kunde && password = password ? show new Control : Display txtBox && pwBox as red
         


        }

        private void Login(object sender, RoutedEventArgs e)
        {
            
            GUIUserRepository usercmds = new GUIUserRepository();
           
            string usn = UsnTxtbox.Text;
            string pw = PasswordBox.Password;
            
            if (usercmds.Verify(usn, pw))
            {
                int kundeID = M120Entities.GUIUsers.FirstOrDefault(x => x.username == usn).UserID;
                Kunde = M120Entities.Kundes.Find(kundeID);
                UsnTxtbox.Background = new SolidColorBrush(Colors.Green);
                PasswordBox.Background = new SolidColorBrush(Colors.Green);
            }

        }

        private void UsnTxtboxFocus(object sender, RoutedEventArgs e)
        {
           
                TextBox tb = (TextBox)sender;
                tb.Text = String.Empty;
                tb.GotFocus -= UsnTxtboxFocus;
            
        }

        private void PasswordBoxFocus(object sender, RoutedEventArgs e)
        {
            PasswordBox tb = (PasswordBox)sender;
            tb.Password = String.Empty;
            tb.GotFocus -= PasswordBoxFocus;
        }

        private void NotRegistered(object sender, RoutedEventArgs e)
        {
            if (MainWindow.Window.ContentGrid.Children.Contains(this))
            {
                MainWindow.Window.ContentGrid.Children.Remove(this);
               
            }
            registrationControl registration = new registrationControl();
            MainWindow.Window.ContentGrid.Children.Add(registration);

            //Get Parent remove this

            //Remove this from Panel and load registration 
        }
    }
}
