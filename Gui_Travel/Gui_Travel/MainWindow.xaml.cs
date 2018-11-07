using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Forms;
using System.Windows.Media;
using Button = System.Windows.Controls.Button;
using Color = System.Drawing.Color;
using Label = System.Windows.Controls.Label;

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
            DataContext = login;

            //If your logged in display Hotels & User Controls


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
            //Find out how to add Button and Label to prompt
            Form prompt = new Form();
            prompt.Width = 500;
            prompt.Height = 100;
            prompt.Text = caption;
            Label textLabel = new Label() { Margin = new Thickness(50,50,50,50), Content = message };
            prompt.BackColor = Color.Green; 
            Button SuccessBtn = new Button() { Content = "Ok", Margin  = new Thickness(250, 70,250,10), Width = 100 };
            SuccessBtn.Click += (sender, e) => { prompt.Close(); };
            prompt.Controls.Add(SuccessBtn);
            if (type != null && type.Equals(Type.Error))
            {
                prompt.BackColor = Color.Red;
                var errorButton = new Button() {Content = "Try again" ,Margin = new Thickness(250, 70, 250, 10), Width = 100 };
                errorButton.Click += (sender, e) => prompt.Close();
                prompt.Controls.Add(errorButton);
            }
            else if (type != null && type.Equals(Type.Exit))
            {
                textLabel.Content = "Do you want to quit GuiTravel ?";
                var yesButton = new Button(){ Content = "Yes", Margin = new Thickness(100, 70, 10, 10), Width = 100 };
                var NoButton = new Button() {Content = "No", Margin = new Thickness(400, 70, 10, 10), Width = 100};
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
