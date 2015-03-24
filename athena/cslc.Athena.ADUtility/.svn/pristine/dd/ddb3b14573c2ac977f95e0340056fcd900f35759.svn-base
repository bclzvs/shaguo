using System;
using System.ComponentModel;
using System.Linq;
using cslc.Athena.Framework;

namespace cslc.Athena.ADUtility
{
    [Serializable]
    public class ADJob
    {
        private String _title;
        private ADJobLevel _level;


        public ADJob() : this("")
        {

        }

        public ADJob(String title): this(title,ADJobLevel.None)
        {
        }

        public ADJob(String title,ADJobLevel level)
        {
            Title = title;
            Level = level;
        }

        public string Title
        {
            get { return _title; }
            set { _title = value; }
        }

        public ADJobLevel Level
        {
            get { return _level; }
            set { _level = value; }
        }

        public String LevelDescription
        {
            get { return EnumHelper.GetDescription(_level); }
        }

        /// <summary>
        /// 用于存储在AD中的数据，格式为Title|Level
        /// </summary>
        public String ADJobTitle
        {
            get { return String.Format("{0}|{1}", Title, Level.ToString()); }
        }

        internal static ADJob Parse(string adJobTitle)
        {
            if(adJobTitle.Trim().Length ==0) return new ADJob();
            
            var values = adJobTitle.Split('|').ToList();
            if(values.Count == 1) return new ADJob(values[0]);
            ADJobLevel level = EnumHelper.Parse<ADJobLevel>(values.Last());
            values.RemoveAt(values.Count - 1);
            String title = String.Join("", values.ToArray());
            return new ADJob(title,level);
        }
    }

    public enum ADJobLevel
    {
        [Description("未知")]
        None,
        [Description("部长(省)")]
        ProvinceMinister,
        [Description("主任(省)")]
        ProvinceDirector,
        [Description("职员(省)")]
        ProvinceWorker,

        [Description("部长(市)")]
        CityMinister,
        [Description("主任(市)")]
        CityDirector,
        [Description("职员(市)")]
        CityWorker,
    }
}
