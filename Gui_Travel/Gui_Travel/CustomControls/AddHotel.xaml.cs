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

namespace Gui_Travel.CustomControls
{
    /// <summary>
    /// Interaction logic for AddHotel.xaml
    /// </summary>
    public partial class AddHotel : UserControl
    {
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
    }
}
