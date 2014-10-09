﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace SmartHaiShu.Utility
{
    // 这个类是实现了DES的加密和解密
    public class SecurityEncryption
    {

        //URL传输参数加密Key这个key可以自己设置支持8位这个东西很重要的,密钥
        private const string _desKey = "e234s678";

        /// <summary>
        /// 加密算法
        /// </summary>
        public static string EncryptDefault(string orignal)
        {
            return Encrypt(orignal, _desKey);
        }


        /// <summary>
        /// 解密算法
        /// </summary>
        public static string DecryptDefault(string orignal)
        {
            return Decrypt(orignal, _desKey);
        }

        /// <summary>
        /// 自加密
        /// </summary>
        /// <param name="originalString"></param>
        /// <param name="sKey"></param>
        /// <returns></returns>
        public static string Encrypt(string originalString, string sKey)
        {
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();

            // 把字符串放到byte数组中
            byte[] inputByteArray = Encoding.Default.GetBytes(originalString);

            des.Key = Encoding.ASCII.GetBytes(sKey); //建立加密对象的密钥和偏移量
            des.IV = Encoding.ASCII.GetBytes(sKey); //原文使用ASCIIEncoding.ASCII方法的GetBytes方法


            MemoryStream ms = new MemoryStream(); //使得输入密码必须输入英文文本
            CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(), CryptoStreamMode.Write);

            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            StringBuilder ret = new StringBuilder();

            foreach (byte b in ms.ToArray())
            {
                ret.AppendFormat("{0:X2}", b);
            }
            ret.ToString();
            return ret.ToString();
        }

        /// <summary>
        /// 自解密
        /// </summary>
        /// <param name="originalString"></param>
        /// <param name="sKey"></param>
        /// <returns></returns>
        public static string Decrypt(string originalString, string sKey)
        {
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();

            byte[] inputByteArray = new byte[originalString.Length/2];
            for (int x = 0; x < originalString.Length/2; x++)
            {
                int i = (Convert.ToInt32(originalString.Substring(x*2, 2), 16));
                inputByteArray[x] = (byte) i;
            }
            //建立加密对象的密钥和偏移量，此值重要，不能修改
            des.Key = Encoding.ASCII.GetBytes(sKey);

            des.IV = Encoding.ASCII.GetBytes(sKey);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(), CryptoStreamMode.Write);

            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();

            //建立StringBuild对象，CreateDecrypt使用的是流对象，必须把解密后的文本变成流对象
            StringBuilder ret = new StringBuilder();

            return System.Text.Encoding.Default.GetString(ms.ToArray());
        }

    }
}
