using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Gui_Travel.ClassRepository;

namespace Gui_Travel.CustomControls
{
    /// <summary>
    /// Interaction logic for AddHotel.xaml
    /// </summary>
    public partial class AddHotel : UserControl
    {
        public Page ParentPage = adminControl.AddPage;
        public AddHotel()
        {
            InitializeComponent();
            
        }

        private void LoadImagefromSource(object sender, RoutedEventArgs e)
        {
            
            //Thanks SO: https://stackoverflow.com/questions/7863952/wheres-the-file-picker-dialog-in-wpf
            var fileDialog = new System.Windows.Forms.OpenFileDialog();
            var result = fileDialog.ShowDialog();
            switch (result)
            {
                case System.Windows.Forms.DialogResult.OK:
                    var file = fileDialog.FileName;
                    TxtFile.Text = file;
                    TxtFile.ToolTip = file;
                    ImagePath(file);
                    break;
                case System.Windows.Forms.DialogResult.Cancel:
                    return;
                default:
                    TxtFile.Text = null;
                    TxtFile.ToolTip = null;
                    break;
            }
        }

        public string ImagePath(string source)
        {
            if (source == "")
            {
                return "../ Images_Icons / no - image.png";
            }

            return source;

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


        private void SaveHotel(object sender, RoutedEventArgs e)
        {
            M120Entities m120Entities = new M120Entities();
            List<Land> countriesList = m120Entities.Lands.ToList();
            HotelRepository hotelRepository = new HotelRepository();
            HotelImageRepository imageRepository = new HotelImageRepository();
            hotelRepository.addHotel(hotelNametxtbox.Text,hotelPlacetxtbox.Text,countriesList.Find(x=> x.Name == hotelCountrycombobox.SelectedValue).Name, Int16.Parse(hotelRatingtxtbox.Text),hotelManagertxtbox.Text,Int16.Parse(hotelAmountofRoomstxtbox.Text),Int16.Parse(hotelPricePerDaytxtbox.Text),hotelPhonetxtbox.Text,hotelEmailtxtbox.Text,hotelWebtxtbox.Text,imageRepository.SaveImageToByte(HotelImage), ImageDescription.Text);
        }

        private void Close(object sender, RoutedEventArgs e)
        {
            ParentPage.Equals(null);
        }
    }
}
