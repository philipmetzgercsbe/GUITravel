using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Gui_Travel.ClassRepository;

namespace Gui_Travel.CustomControls
{
    /// <summary>
    /// Interaction logic for AddTravel.xaml
    /// </summary>
    public partial class AddTravel : UserControl
    {
        public bool Staff;
        public AddTravel()
        {
            InitializeComponent();
            addCountries();
        }

        private static readonly Regex _regex = new Regex("[^0-9.-]+"); //regex that matches disallowed text
        private static bool IsTextAllowed(string text)
        {
            return !_regex.IsMatch(text);
        }

        private new void PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = !IsTextAllowed(e.Text);
        }

        private void SaveTravel(object sender, RoutedEventArgs e)
        {
           ReiseRepository reiseRepository = new ReiseRepository();
           reiseRepository.addTravel(travelCountryCombobox.SelectedItem.ToString(),travelStartdtpck.SelectedDate.Value,travelEnddtpck.SelectedDate.Value,Int16.Parse(travelPricetxtbox.Text),Staff,travelStaffNametxtbox.Text);
        }

        private void addCountries()
        {
            M120Entities m120Entities = new M120Entities();
            var countriesList = m120Entities.Lands.ToList();
            foreach (var country in countriesList)
            {
                travelCountryCombobox.Items.Add(country.Name);
            }
        }

        private void Set(object sender, RoutedEventArgs e)
        {
            if (this.Name.Contains("Yes"))
            {
                Yesrdbtn.IsChecked = true;
                Staff = true;
            }else if (this.Name.Contains("No"))
            {
                Nordbtn.IsChecked = true;
                Staff = false;

            }
        }
    }
}
