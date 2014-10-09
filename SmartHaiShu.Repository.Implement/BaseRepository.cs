using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using SmartHaiShu.Repository.Interface;
using SmartHaisuModel;

namespace SmartHaiShu.Repository.Implement
{
    public class BaseRepository<T> : IBaseRepository<T> where T : class 
    {
        protected SmartHsContext nContext = ContextFactory.GetSmartHsContext();

        public T Add(T entity)
        {
            nContext.Entry<T>(entity).State = System.Data.Entity.EntityState.Added;
            nContext.SaveChanges();
            return entity;
        }

        public int Count(Expression<Func<T, bool>> predicate)
        {
            return nContext.Set<T>().Count(predicate);
        }

        public bool Update(T entity)
        {
            nContext.Set<T>().Attach(entity);
            nContext.Entry<T>(entity).State = System.Data.Entity.EntityState.Modified;
            return nContext.SaveChanges() > 0;
        }

        public bool Delete(T entity)
        {
            nContext.Set<T>().Attach(entity);
            nContext.Entry<T>(entity).State = System.Data.Entity.EntityState.Deleted;
            return nContext.SaveChanges() > 0;
        }

        public bool Exist(Expression<Func<T, bool>> anyLambda)
        {
            return nContext.Set<T>().Any(anyLambda);
        }

        public T Find(long id)
        {
            return nContext.Set<T>().Find(id);
        }

        public IQueryable<T> Find(Expression<Func<T, bool>> whereLambda)
        {
            IQueryable<T> entities = nContext.Set<T>().Where(whereLambda);
            return entities;
        }

        
    }
}
