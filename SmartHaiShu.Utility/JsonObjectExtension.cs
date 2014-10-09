using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json.Linq;

namespace SmartHaiShu.Utility
{
    public static class JsonObjectExtension
    {
        public static JObject JObjParse(this string orignal)
        {
            if (string.IsNullOrEmpty(orignal))
            {
                return null;
            }
            else
            {
                return JObject.Parse(orignal);
            }
        }

        public static bool JObjCodeTrue(this string orignal)
        {
            return orignal.JObjCode() == 1;
        }

        public static int JObjCode(this string orignal)
        {
            var jobj = orignal.JObjParse();
            return Convert.ToInt32(jobj["Code"]);
        }

        public static IEnumerable<JToken> JObjMessageToken(this string orignal)
        {
            var jobj = orignal.JObjParse();
            return from jp in jobj["Message"]
                select jp;
        }


        public static IEnumerable<JToken> JObjMessageInner(this string orignal, string key)
        {
            var jobj = orignal.JObjParse();
            return jobj["Message"][key];

        }

        public static T JobjMessageConvert<T>(this string orignal)
        {
            var jobj = orignal.JObjParse();
            return (T)Convert.ChangeType(jobj["Message"], typeof (T));
        }


        public static T ValueOrDefault<T>(this IEnumerable<JToken> token)
        {
            if (token == null)
            {
                return default(T);
            }
            else
            {
                return token.Value<T>();
            }
        }
    }
}
