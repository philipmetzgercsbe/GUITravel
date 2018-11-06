using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace Gui_Travel.ClassRepository
{
    class HotelImageRepository
    {
        public static M120Entities M120Entities;


        public void addImage(Image image, string description)
        {
            SaveImageToByte(image, description);
            
        }

        public byte[] SaveImageToByte(Image image, string desc)
        {
            MemoryStream m1 = new MemoryStream();
            image.Save(m1, System.Drawing.Imaging.ImageFormat.Gif);
            saveImageToDb(m1.ToArray(), desc);
            return m1.ToArray();
        }
    }
}
