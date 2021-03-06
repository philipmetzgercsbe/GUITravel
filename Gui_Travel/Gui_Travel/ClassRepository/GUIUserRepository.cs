﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;

namespace Gui_Travel.ClassRepository
{
    class GUIUserRepository
    {
        public static GUIUser GuiUser;
        private Dictionary<string,string> UserHash = new Dictionary<string, string>();
        public static M120Entities M120Entities  = new M120Entities();
        
        public void addUser(string username, string password)
        {
            GuiUser = new GUIUser();
            var salt = CreateSalt();
            GuiUser.username = username;
            GuiUser.password = Hash(password,salt);
            UserHash.Add(username,salt);
            M120Entities.SaveChanges();
            M120Entities.GUIUsers.Add(GuiUser);
            M120Entities.SaveChanges();

        }

        public void removeUser(GUIUser guiUser)
        {
            M120Entities.GUIUsers.Remove(guiUser);
        }

        public void editUser(GUIUser user, string username, string password)
        {
            var salt = CreateSalt();
            var toEdit = M120Entities.GUIUsers.Find(user) ?? throw new ArgumentNullException("User doesn't exist");
            toEdit.username = username;
            toEdit.password = Hash(password, salt);
            M120Entities.SaveChanges();
        }
        private static string Hash(string password, string salt)
        {
           var hashedPW = BCrypt.Net.BCrypt.HashPassword(password, salt);
           
           return hashedPW;

        }

        public bool Verify(string password,string username)
        {
            
            if (UserHash.TryGetValue(username, out var keyhash))
            {
                BCrypt.Net.BCrypt.Verify(password, keyhash);
                return true;
            }

            return false;

        }

        
        private static string CreateSalt()
        {
            var Salt = BCrypt.Net.BCrypt.GenerateSalt(20);
            return Salt;
        }

        public void removeAll()
        {
            var users = M120Entities.GUIUsers.ToList();
            foreach (var u in users)
            {
                M120Entities.GUIUsers.Remove(u);
            }
        }

        
    }
}
