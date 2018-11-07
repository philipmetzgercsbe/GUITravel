using System;
using System.IO;
using System.Drawing;
using System.Windows.Media.Imaging;

namespace Gui_Travel.ClassRepository
{
    class HotelImageRepository
    {
        public static M120Entities M120Entities = new M120Entities();
        public static HotelBild HotelBild = new HotelBild();

        

        public Image ByteArraytoImage(byte[] imgBytes)
        {
            MemoryStream ms = new MemoryStream(imgBytes);
            Image returnImage = Image.FromStream(ms);
            return returnImage;
        }
        public byte[] SaveImageToByte(Image image, string desc)
        {
            MemoryStream memStream = new MemoryStream();
            image.Save(memStream, System.Drawing.Imaging.ImageFormat.Gif);
            AddAttributes(desc, memStream);
            return memStream.ToArray();
        }

        private static void AddAttributes(string desc, MemoryStream m1)
        {
            HotelBild.Bild = m1.ToArray();
            HotelBild.Beschreibung = desc;
            M120Entities.SaveChanges();
        }

        public  BitmapImage BitmapImageFromBytes(byte[] bytes)
        {
            BitmapImage image = null;
            MemoryStream stream = null;
            try
            {
                if (bytes != null)
                {
                    stream = new MemoryStream(bytes);
                    stream.Seek(0, SeekOrigin.Begin);
                    System.Drawing.Image img = System.Drawing.Image.FromStream(stream);
                    image = new BitmapImage();
                    image.BeginInit();
                    MemoryStream ms = new MemoryStream();
                    img.Save(ms, System.Drawing.Imaging.ImageFormat.Bmp);
                    ms.Seek(0, SeekOrigin.Begin);
                    image.StreamSource = ms;
                    image.StreamSource.Seek(0, SeekOrigin.Begin);
                    image.EndInit();
                }
                else
                {
                    stream = new MemoryStream(0);
                    image = new BitmapImage();
                }
            }
            catch (Exception)
            {

            }
            finally
            {
                stream.Close();
                stream.Dispose();
            }
            return image;
        }

    }

}
