using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using SmartHaiShu.BizLogic.Interface;
using SmartHaiShu.Repository.Interface;


namespace SmartHaiShu.BizLogic.Implement
{
    public abstract class BaseLogic<T> : IBaseLogic<T> where T : class
    {
        protected IBaseRepository<T> CurrentRepository { get; set; }

        public BaseLogic(IBaseRepository<T> currentRepository)
        {
            CurrentRepository = currentRepository;
        }

        public T Add(T entity)
        {
            return CurrentRepository.Add(entity);
        }

        public bool Update(T entity)
        {
            return CurrentRepository.Update(entity);
        }

        public bool Delete(T entity)
        {
            return CurrentRepository.Delete(entity);
        }

        public T Find(long id)
        {
            return CurrentRepository.Find(id);
        }

        public IQueryable<T> Find(Expression<Func<T,bool>> where)
        {
            return CurrentRepository.Find(where);
        }
    }
}
