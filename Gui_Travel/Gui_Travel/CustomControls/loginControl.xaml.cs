using System;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using Gui_Travel.ClassRepository;
using Gui_Travel.CustomControls;

namespace Gui_Travel
{
    /// <summary>
    /// Interaction logic for loginControl.xaml
    /// </summary>
    public partial class loginControl : UserControl
    {
        private Kunde Kunde;
        
        public static M120Entities M120Entities = new M120Entities();
        public static loginControl LoginControl;
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
                int kundeID = (int)M120Entities.GUIUsers.FirstOrDefault(x => x.username == usn).UserID;
                Kunde = M120Entities.Kundes.Find(kundeID);
               
            }
            MainWindow.Window.AddMessageBox("Successfull login", "Your logged in");
            tabControl MainTab = new tabControl();
            MainWindow.Window.ContentGrid.Children.Remove(this);
            MainWindow.Window.ContentGrid.Children.Add(MainTab);


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
            //registration reloads login and from here on we go on
            //Get Parent remove this

            //Remove this from Panel and load registration 
        }

        public Kunde GetKunde()
        {
            return Kunde;
        }
    }
}
