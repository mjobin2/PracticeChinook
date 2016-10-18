using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChinookSystem.Security
{
    public enum UnregisteredUserType { Undefined, Employee, Customer}
    public class UnregisteredUserProfile
    {
        public string UserId { get; set; } //generated
        public string UserName { get; set; } //collected
        public string Email { get; set; } //collected
        public string FirstName { get; set; }//comes from usertable
        public string LastName { get; set; }//comes from user table
        public UnregisteredUserType UserType { get; set; }
    }
}
