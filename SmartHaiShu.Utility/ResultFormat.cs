using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;


namespace SmartHaiShu.Utility
{
    public class ResultFormat
    {
        
        public int Code { get; set; }


        public object Message { get; set; }

        public ResultFormat(int code)
        {
            Code = code;
        }

        public ResultFormat(int code, object message)
        {
            Code = code;
            Message = message;
        }

        public static string ConvertMessage<T>(T complex) where T : class
        {
            return JsonConvert.SerializeObject(complex, Formatting.None);
        }

        public static string ConvertList<T>(T listObject) where T : IEnumerable
        {
            JArray array = new JArray();
            foreach (var it in listObject)
            {
                var props = it.GetType().GetProperties().Where(item => item.CanRead);
                JObject obj = new JObject();
                foreach (var prop in props)
                {
                    obj[prop.Name] = JToken.FromObject(prop.GetValue(it, null));
                }
                array.Add(obj);
            }
            return array.ToString();
        }

        public override string ToString()
        {
            return JsonConvert.SerializeObject(this, new JsonSerializerSettings() { NullValueHandling = NullValueHandling.Ignore });
        }
    }
}
