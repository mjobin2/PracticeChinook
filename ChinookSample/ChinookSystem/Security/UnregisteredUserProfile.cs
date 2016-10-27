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
        public int CustomerEmployeeId { get; set; } //generated
        public string AssignedUserName { get; set; } //collected
        public string AssignedEmail { get; set; } //collected
        public string FirstName { get; set; }//comes from usertable
        public string LastName { get; set; }//comes from user table
        public UnregisteredUserType UserType { get; set; }
    }
}
