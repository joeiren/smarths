using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaisuModel;


namespace SmartHaiShu.WcfService.OpenDataLogic
{
    public class HospitalLogic
    {
        public int HospitalLocationCount()
        {
            int count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_1_1
                         select entity).Count();
            return count;
        }

        public IEnumerable <b_t_ufp_1_1> LoadHospitalLoaction(int pageSize, int pageNo)
        {
            var result = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_1_1
                          orderby entity.TYPE1 descending, entity.CHECK_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1)*pageSize).Take(pageSize);
            return result;
        }

        public int HospitalDoctorCount()
        {
            int count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_1_2
                         select entity).Count();
            return count;
        }

        public IEnumerable <b_t_ufp_1_2> LoadHospitalDoctors(int pageSize, int pageNo)
        {
            var result = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_1_2
                          orderby entity.CHECK_TIME descending
                          select entity).Skip(Math.Max(0, pageNo - 1)*pageSize).Take(pageSize);
            return result;
        }

        public IEnumerable <string> LoadAllDoctorHospitals()
        {
            var result = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_1_2
                          orderby entity.NAME
                          select entity.NAME).Distinct().OrderBy(it=>it).ToList();
            return result;
        }

        public IEnumerable <string> LoadDoctorDepartmentsByHostpital(string hospital)
        {
            var result = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_1_2
                          where !string.IsNullOrEmpty(entity.DEPARTMENT) && String.Compare(entity.NAME, hospital, StringComparison.Ordinal) == 0
                          select entity.DEPARTMENT).Distinct().OrderBy(it=>it).ToList();
            return result;
        }

        public int HospitalDoctorCountBy(string hospital, string department)
        {
            int count = 0;
            if (!string.IsNullOrEmpty(hospital) && !string.IsNullOrEmpty(department))
            {
                count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_1_2
                         where entity.NAME == hospital && entity.DEPARTMENT== department
                         select entity).Count();
            }
            else if (!string.IsNullOrEmpty(hospital))
            {
                count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_1_2
                         where entity.NAME == hospital
                         orderby entity.CHECK_TIME descending
                         select entity).Count();
            }
            else if (!string.IsNullOrEmpty(department))
            {
                count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_1_2
                         where entity.DEPARTMENT == department
                         select entity).Count();
            }
            else
            {
                count = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_1_2
                         select entity).Count();
                return count;
            }
            return count;
        }


        public IEnumerable <b_t_ufp_1_2> LoadHospitalDoctorsBy(string hospital, string department, int pageSize,
                                                             int pageNo)
        {
            IEnumerable <b_t_ufp_1_2> result = null;
            if (!string.IsNullOrEmpty(hospital) && !string.IsNullOrEmpty(department))
            {
                result = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_1_2
                          where entity.NAME == hospital && entity.DEPARTMENT== department
                          orderby entity.NAME descending, entity.DEPARTMENT descending 
                          select entity).Skip(Math.Max(0, pageNo - 1)*pageSize).Take(pageSize).ToList();
            }
            else if (!string.IsNullOrEmpty(hospital))
            {
                result = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_1_2
                          where entity.NAME == hospital
                          orderby entity.NAME descending, entity.DEPARTMENT descending 
                          select entity).Skip(Math.Max(0, pageNo - 1) * pageSize).Take(pageSize).ToList();
            }
            else if (!string.IsNullOrEmpty(department))
            {
                result = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_1_2
                          where entity.DEPARTMENT == department
                          orderby entity.NAME descending, entity.DEPARTMENT descending 
                          select entity).Skip(Math.Max(0, pageNo - 1) * pageSize).Take(pageSize).ToList();
            }
            else
            {
                result = (from entity in ContextFactory.GetOpenDataContext().Db_b_t_ufp_1_2
                          orderby entity.NAME descending, entity.DEPARTMENT descending 
                          select entity).Skip(Math.Max(0, pageNo - 1) * pageSize).Take(pageSize).ToList();
                return result;
            }
            return result;
        }
    }
}