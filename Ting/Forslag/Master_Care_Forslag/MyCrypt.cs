﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;


public class MyCrypt
{
    private static byte[] key = { };
    private static byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };
    private static string sEncryptionKey = ConfigurationManager.AppSettings["GetKey"];
    public static string Decrypt(string stringToDecrypt)
    {
        byte[] inputByteArray = new byte[stringToDecrypt.Length + 1];

        try
        {
            key = Encoding.UTF8.GetBytes(sEncryptionKey.ToCharArray(), 0, 8);
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            inputByteArray = Convert.FromBase64String(stringToDecrypt.Normalize().Replace(" ", "+"));
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(key, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            Encoding encoding = Encoding.UTF8;
            return encoding.GetString(ms.ToArray());
        }
        catch (Exception e)
        {
            return e.Message;
        }
    }

    public static string Encrypt(string stringToEncrypt)
    {
        try
        {
            key = Encoding.UTF8.GetBytes(sEncryptionKey.ToCharArray(), 0, 8);
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            byte[] inputByteArray = Encoding.UTF8.GetBytes(stringToEncrypt);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(key, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            return Convert.ToBase64String(ms.ToArray());
        }
        catch (Exception e)
        {
            return e.Message;
        }
    }
    public static string HashPassword(string password, string salt)
    {
        var combinedPassword = string.Concat(password, salt);
        var sha256 = new SHA256Managed();
        var bytes = UTF8Encoding.UTF8.GetBytes(combinedPassword);
        var hash = sha256.ComputeHash(bytes);
        return Convert.ToBase64String(hash);
    }

    public static string GetRandomSalt(Int32 size = 12)
    {
        var random = new RNGCryptoServiceProvider();
        var salt = new byte[size];
        random.GetBytes(salt);
        return Convert.ToBase64String(salt);
    }

    public static string EscString(string txt)
    {
        string returnString = txt.Replace("&", "&amp;");
        returnString = returnString.Replace(">", "&gt;");
        returnString = returnString.Replace("<", "&lt;");
        returnString = returnString.Replace("\"", "&quot;");
        returnString = returnString.Replace("'", "&apos;");

        return returnString;
    }

    public static string SubStr(string txt, int nr)
    {
        string returnString = "";

        if (txt.Length > nr)
        {
            int newLength = txt.Substring(0, nr).LastIndexOf(" ");
            returnString = txt.Substring(0, newLength) + "...";
        }
        else
        {
            returnString = txt;
        }

        return returnString;
    }

    public static string NewPassGen(int Nr)
    {
        Random rnd = new Random();

        string _StrList = "q Q w W e E r R t T y Y u U i I o O p P a A s S d D f F g G h H j J k K l L z Z x X c C v V b B n N m M 1 2 3 4 5 6 7 8 9 0";
        string[] _ArrList = { };
        string _NewPass = "";

        _ArrList = _StrList.Split(' ');
        int max = _ArrList.Length;
        int min = 0;

        for (int i = 0; i < Nr; i++)
        {
            _NewPass += _ArrList[rnd.Next(min, max)];
        }

        return _NewPass;
    }

    public static string MyExclude(string txt, List<string> ArrWords, List<string> ArrImg, string imgPath)
    {
        List<string> _Replacement = new List<string>();
        string _rex = @"\b({0})(s?)\b";
        string NewTxt = "";
        int t = 0;

        RegexOptions Options = RegexOptions.IgnoreCase | RegexOptions.IgnorePatternWhitespace;

        for (int i = 0; i < ArrImg.Count; i++)
        {
            _Replacement.Add("<img style='width: 75px' src='" + imgPath + "/" + ArrImg[i] + "'/>");
        }

        IEnumerable<Regex> WordMatchers = ArrWords.Select(x => new Regex(string.Format(_rex, x), Options));

        NewTxt = WordMatchers.Aggregate(txt, (current, matcher) => matcher.Replace(current, _Replacement[t++].ToString()));

        return NewTxt;
    }
}