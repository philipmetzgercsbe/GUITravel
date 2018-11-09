using System;
using System.Collections.Generic;
using System.Linq;
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
    /// Interaction logic for registrationControl.xaml
    /// </summary>
    public partial class registrationControl : UserControl
    {
        public List<TextBox> RequiredForms;
        
        public registrationControl()
        {
            InitializeComponent();
            LoadCountryShortName();
        }

        private void Register(object sender, RoutedEventArgs e)
        {
            if (!CheckRequired())
            {
                MainWindow.Window.AddMessageBox("Required fields are empty", "Missing Data", MainWindow.Type.Error);
                return;
            }
            KundeRepository kundeRepository = new KundeRepository();

            
            string usersalututation = Enum.GetName(typeof(KundeRepository.Anrede), (KundeRepository.Anrede) (SalutationComboBox.SelectedIndex ));
            Enum.TryParse<KundeRepository.Anrede>(usersalututation, out var mySalutation);
            

            kundeRepository.addKunde(mySalutation,FirstnameTxtbox_.Text,SecondnameTxtbox.Text,LastnameTxtbox_.Text, SteetNrTxtbox_.Text,Convert.ToInt16(ZIPTxtbox_.Text),PlaceTxtbox_.Text,PhoneTxtbox.Text,MobileTxtbox.Text,EmailTxtbox_.Text,(DateTime) BirthdateDtPck.SelectedDate,PassNrTxtbox.Text,NationalityCombobox_.SelectedValue.ToString(),usnTxtBox_.Text, passwordBox.Password);
            MainWindow.Window.AddMessageBox("You were successfully registered", "Success");
            MainWindow.Window.ContentGrid.Children.Remove(this);
            loginControl login = new loginControl();
            MainWindow.Window.ContentGrid.Children.Add(login);


        }

        public bool CheckRequired()
        {
            RequiredForms = MainWindow.FindVisualChildren<TextBox>(this).ToList();
            var Panels = MainWindow.FindVisualChildren<StackPanel>(this).ToList();
            foreach (var txtbox in RequiredForms)
            {
                if (txtbox.Name.Contains("_") && txtbox.Text.Contains("") && passwordBox.Password.Contains("") && SalutationComboBox.SelectedItem.ToString() == "" && SalutationComboBox.SelectedItem.Equals(null))
                {
                    
                    //MainPanel.Children.Add()
                    txtbox.Background = new SolidColorBrush(Colors.Firebrick);
                    passwordBox.Background = new SolidColorBrush(Colors.Firebrick);
                    SalutationComboBox.Background = new SolidColorBrush(Colors.Firebrick);
                    foreach (var panel in Panels)
                    {
                        if (panel.Name != "MainPanel")
                        {
                            Label errorLabel = new Label() { Content = "Required", Foreground = new SolidColorBrush(Colors.Firebrick) };
                            panel.Children.Add(errorLabel);
                        }
                        
                        

                    }
                   
                    return false;

                }
                

            }

            return true;

        }

        private void LoadCountryShortName()
        {
            List<Land> CountriesList;
            M120Entities m120Entities = new M120Entities();
            CountriesList = m120Entities.Lands.ToList();
            foreach (var country in CountriesList)
            {
                NationalityCombobox_.Items.Add(country.Kurzname);


            }
            
        }

        
    }
}
