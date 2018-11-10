using System;
using System.Windows;
using System.Windows.Controls;
using Gui_Travel.ClassRepository;

namespace Gui_Travel.CustomControls
{
    /// <summary>
    /// Interaction logic for UserInformation.xaml
    /// </summary>
    public partial class UserInformation : UserControl
    {
        
        public UserInformation()
        {
            InitializeComponent();
            SetInformation();
            
        }

        private void SaveInformation(object sender, RoutedEventArgs e)
        {
          
            KundeRepository kundeRepository = new KundeRepository();
            Kunde kundetochange = loginControl.LoginControl.GetKunde();     
            Enum.TryParse<KundeRepository.Anrede>(SalutationComboBox.Text, out var salutation);            
            kundeRepository.editKunde(kundetochange, salutation, FirstnameTxtbox.Text,SecondnameTxtbox.Text,LastnameTxtbox.Text, SteetNrTxtbox.Text,Int16.Parse(ZIPTxtbox.Text),PlaceTxtbox.Text,PhoneTxtbox.Text,MobileTxtbox.Text,EmailTxtbox.Text,(DateTime)BirthdateDtPck.SelectedDate,PassNrTxtbox.Text,NationalitybTxtbox.Text,usnTxtBox.Text,passwordBox.Password );

        }

        private void SetInformation()
        {  
            M120Entities m120Entities = new M120Entities();
            Kunde kundetochange = loginControl.LoginControl.GetKunde();
            this.FirstnameTxtbox.Text = kundetochange.Vorname;
            this.SecondnameTxtbox.Text = kundetochange.NameZusatz;
            this.LastnameTxtbox.Text = kundetochange.Name;
            this.SteetNrTxtbox.Text = kundetochange.StrasseNr;
            this.ZIPTxtbox.Text = kundetochange.PLZ.ToString();
            this.PlaceTxtbox.Text = kundetochange.Ort;
            this.PhoneTxtbox.Text = kundetochange.Telefon;
            this.MobileTxtbox.Text = kundetochange.Mobile;
            this.BirthdateDtPck.DisplayDate = kundetochange.Geburtsdatum;
            this.PassNrTxtbox.Text = kundetochange.PassNr;
            this.usnTxtBox.Text = m120Entities.GUIUsers.Find(kundetochange.UserFK)?.username ?? throw new InvalidOperationException();
            this.passwordBox.Password = m120Entities.GUIUsers.Find(kundetochange.UserFK)?.password ?? throw new InvalidOperationException();
        }
    }
}
