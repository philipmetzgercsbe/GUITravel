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
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            registrationControl registration = new registrationControl();
            Hotel hotel = new Hotel();
            KundeRepository kunde = new KundeRepository();
            kunde.addKunde(KundeRepository.Anrede.Herr,"Tarek","","Stauffer","13",4500,"Bern","+41 131 13 13 ","+41 594 73 73","tarek.stauffer@email.com",DateTime.Now,"13","CH");
            

            //If your logged in display Hotels & User Controls


        }
    }
}
