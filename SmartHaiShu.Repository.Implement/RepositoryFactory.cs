using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartHaiShu.Repository.Interface;


namespace SmartHaiShu.Repository.Implement
{
    public class RepositoryFactory
    {
        public static IMemberRepository MemberRepo
        {
            get
            {
                return new MemberRepository();
            }
        }

        public static ICommunityRepository CommunityRepo
        {
            get
            {
                return new CommunityRepository();
            }
        }

        public static ISessionVerifyRepository SessionVerifyRepo
        {
            get
            {
                return new SessionVerifyRepository();
            }
        }

        public static IGlobalTypeConfigRepository GlobalTypeConfigRepo
        {
            get
            {
                return new GlobalTypeConfigRepository();
            }
        }

        public static IInteractPostRepository InteractPostRepo
        {
            get
            {
                return new InteractPostRepository();
            }
        }
    }
}