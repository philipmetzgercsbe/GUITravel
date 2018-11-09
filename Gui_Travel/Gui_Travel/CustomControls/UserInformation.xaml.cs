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
           Kunde kundetochange = loginControl.Kunde;     
            Enum.TryParse<KundeRepository.Anrede>(SalutationComboBox.Text, out var salutation);            
            kundeRepository.editKunde(kundetochange, salutation, FirstnameTxtbox.Text,SecondnameTxtbox.Text,LastnameTxtbox.Text, SteetNrTxtbox.Text,Int16.Parse(ZIPTxtbox.Text),PlaceTxtbox.Text,PhoneTxtbox.Text,MobileTxtbox.Text,EmailTxtbox.Text,(DateTime)BirthdateDtPck.SelectedDate,PassNrTxtbox.Text,NationalitybTxtbox.Text,usnTxtBox.Text,passwordBox.Password );

        }

        private void SetInformation()
        {  
            M120Entities m120Entities = new M120Entities();
            this.FirstnameTxtbox.Text = loginControl.Kunde.Vorname;
            this.SecondnameTxtbox.Text = loginControl.Kunde.NameZusatz;
            this.LastnameTxtbox.Text = loginControl.Kunde.Name;
            this.SteetNrTxtbox.Text = loginControl.Kunde.StrasseNr;
            this.ZIPTxtbox.Text = loginControl.Kunde.PLZ.ToString();
            this.PlaceTxtbox.Text = loginControl.Kunde.Ort;
            this.PhoneTxtbox.Text = loginControl.Kunde.Telefon;
            this.MobileTxtbox.Text = loginControl.Kunde.Mobile;
            this.BirthdateDtPck.DisplayDate = loginControl.Kunde.Geburtsdatum;
            this.PassNrTxtbox.Text = loginControl.Kunde.PassNr;
            this.usnTxtBox.Text = m120Entities.GUIUsers.Find(loginControl.Kunde.UserFK)?.username ?? throw new InvalidOperationException();
            this.passwordBox.Password = m120Entities.GUIUsers.Find(loginControl.Kunde.UserFK)?.password ?? throw new InvalidOperationException();
        }
    }
}
