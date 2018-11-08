using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Forms;
using System.Windows.Media;
using Button = System.Windows.Controls.Button;
using WinFButton = System.Windows.Forms.Button;
using Color = System.Drawing.Color;
using Label = System.Windows.Controls.Label;
using WinFLabel = System.Windows.Forms.Label;

namespace Gui_Travel
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static MainWindow Window;

        public enum Type
        {
            Error,Exit
        }
        public MainWindow()
        {
            InitializeComponent();
            Window = this;
            loginControl login = new loginControl();
            ContentGrid.Children.Add(login);
           

            


        }

        /// <summary>
        /// Finds all visual Children in Form with the given Parameters useable for lists etc
        /// Source:https://stackoverflow.com/questions/974598/find-all-controls-in-wpf-window-by-type
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="depObj"></param>
        /// <returns></returns>
        public static IEnumerable<T> FindVisualChildren<T>(DependencyObject depObj) where T : DependencyObject
        {
            if (depObj != null)
            {
                for (int i = 0; i < VisualTreeHelper.GetChildrenCount(depObj); i++)
                {
                    DependencyObject child = VisualTreeHelper.GetChild(depObj, i);
                    if (child != null && child is T)
                    {
                        yield return (T)child;
                    }

                    foreach (T childOfChild in FindVisualChildren<T>(child))
                    {
                        yield return childOfChild;
                    }
                }
            }
        }

        public void AddMessageBox(string message, string caption , Enum type = null)
        {
            
            Form prompt = new Form();
            prompt.Width = 500;
            prompt.Height = 100;
            prompt.Text = caption;
            WinFLabel textLabel = new WinFLabel() { Top = 50,Left =50, Text = message };
            prompt.BackColor = Color.Green;
            WinFButton SuccessBtn = new WinFButton() { Text = "Ok", Left = 250,Top = 70, Width = 100 };
            SuccessBtn.Click += (sender, e) => { prompt.Close(); };
            prompt.Controls.Add(SuccessBtn);
            if (type != null && type.Equals(Type.Error))
            {
                prompt.BackColor = Color.Red;
                var errorButton = new WinFButton() {Text = "Try again", Left =250, Top = 70, Width = 100 };
                errorButton.Click += (sender, e) => prompt.Close();
                prompt.Controls.Add(errorButton);
            }
            else if (type != null && type.Equals(Type.Exit))
            {
                textLabel.Text = "Do you want to quit GuiTravel ?";
                WinFButton yesButton = new WinFButton(){ Text = "Yes", Top = 100, Left = 70, Width = 100 };
                WinFButton NoButton = new WinFButton() { Text = "No", Top = 400, Left = 70,  Width = 100};
                NoButton.Click += (sender, e) => prompt.Close();
                yesButton.Click += (sender, e) => { MainWindow.Window.Close(); prompt.Close(); };
                prompt.Controls.Add(yesButton);
                prompt.Controls.Add(NoButton);
            }
            

            prompt.Controls.Add(textLabel);
            prompt.ShowDialog();

        }
    }
}
