using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Master_Care_Forslag
{
    public class UrlEncode
    {
        public static string Encode(string input)
        {
            input = input.Replace("-", " ");

            input = Regex.Replace(input, @"\s+", " ");

            input = input.Replace(" ", "-");

            return input.ToLower(); 
        }
    }
}