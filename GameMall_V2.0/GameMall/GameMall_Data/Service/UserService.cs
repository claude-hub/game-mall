using GameMall_Data.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace GameMall_Data.Service
{
    public class UserService
    {
        private GameMallDBContext _x;
        public UserService()
        {
            _x = new GameMallDBContext();
        }
        //添加管理员
        public void AddUserByCon(Users user)
        {
            _x.Users.Add(user);
            _x.Admin.Add(new Admin
            {
                UserId = user.UserId,
            });
            _x.SaveChanges();
        }
        public void AddUser(Users user, Guid roleId)
        {
            if (roleId != null)
            {
                _x.Users.Add(user);
                _x.SaveChanges();
                var admin = new Admin
                {
                    UserId = user.UserId,
                };
                admin.Roles.Add(GetRoleByRoleId(roleId));
                _x.Admin.Add(admin);
                _x.SaveChanges();
            }
            else
            {
                _x.Users.Add(user);
                var admin = new Admin
                {
                    UserId = user.UserId,
                };
                _x.Admin.Add(admin);
            }
            _x.SaveChanges();
        }
        public void AddCustomer(string userName, string password)
        {
            Users user = new Users()
            {
                CreationTime = DateTime.Now,
                Password = password,
                UserName = userName,
            };
            Customers customer = new Customers()
            {
                UserId = user.UserId,
            };
            _x.Customers.Add(customer);
            _x.Users.Add(user);
            _x.SaveChanges();
        }
        public Roles GetRoleByRoleId(Guid roleId)
        {
            return _x.Roles.SingleOrDefault(item => item.RoleId == roleId);
        }
        public void AddAddress(DeliveryAddress address)
        {
            _x.DeliveryAddress.Add(address);
            _x.SaveChanges();
        }
        public void AddAdminLog(AdminLog adminLog)
        {
            _x.AdminLog.Add(adminLog);
            _x.SaveChanges();
        }
        public string GetAddressIP()
        {
            ///获取本地的IP地址
            string AddressIP = string.Empty;
            foreach (IPAddress _IPAddress in Dns.GetHostEntry(Dns.GetHostName()).AddressList)
            {
                if (_IPAddress.AddressFamily.ToString() == "InterNetwork")
                {
                    AddressIP = _IPAddress.ToString();
                }
            }
            return AddressIP;
        }
        public void AddCustomer(Users user)
        {
            _x.Users.Add(user);
            _x.Customers.Add(new Customers
            {
                UserId = user.UserId,
            });
            _x.SaveChanges();
        }
        public void GiveAdminPermissions(Admin admin)
        {
            foreach (var item in _x.Permissions.ToList())
            {
                admin.Permissions.Add(item);
            }
            _x.SaveChanges();
        }
        //获取所有权限
        public List<Permissions> GetAllPermissions()
        {
            return _x.Permissions.ToList();
        }
        //登录
        public Users Login(string userName, string password)
        {
            try
            {
                //获取用户集合
                List<Users> users = _x.Users.ToList();
                //根据输入的用户名和用户密码查找用户
                var user = users.SingleOrDefault(Users => (Users.UserName == userName) && Users.Password == password);
                return user;

            }
            catch
            {
                return null;
            }

        }
        //判断User的身份
        public Admin IfAdmin(Users user)
        {
            try
            {
                //获取管理员和顾客列表
                var admins = _x.Admin.ToList();
                return admins.SingleOrDefault(m => m.UserId == user.UserId);
            }
            catch
            {
                return null;
            }

        }
        public Customers IfCustomer(Users user)
        {
            try
            {
                //获取管理员和顾客列表
                var customers = _x.Customers.ToList();
                return customers.SingleOrDefault(m => m.UserId == user.UserId);
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 发送验证码
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public string SendEmailOfVerifyCode(string email)
        {
            int customerID = 1;
            string verifyCode = Guid.NewGuid().ToString();
            try
            {
                System.Net.Mail.MailAddress from = new System.Net.Mail.MailAddress("314705487@qq.com", "云翳商城"); //填写电子邮件地址，和显示名称
                System.Net.Mail.MailAddress to = new System.Net.Mail.MailAddress(email, "客户"); //填写邮件的收件人地址和名称
                //设置好发送地址，和接收地址，接收地址可以是多个
                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                mail.From = from;
                mail.To.Add(to);
                mail.Subject = "验证码";

                StringBuilder strBody = new StringBuilder();
                strBody.Append("请将下面的验证码输入到重置密码的验证处，仅限本次访问有效，验证码只能使用一次，请尽快重置密码！</br>");
                strBody.Append("<h3>验证码:&emsp;" + verifyCode + "</h3>");
                strBody.Append("<a href='http://123.207.242.177:31061/Order/ActivePage?customerID=" + customerID + "&valiDataCode =" + verifyCode + "'>点击这里</a></br>");

                mail.Body = strBody.ToString();
                mail.IsBodyHtml = true;//设置显示htmls

                //设置好发送邮件服务地址
                System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
                client.Host = "smtp.qq.com";

                //填写服务器地址相关的用户名和密码信息
                client.Credentials = new System.Net.NetworkCredential("314705487@qq.com", "gxzcuzewxuymbiaf");
                client.EnableSsl = true;

                //发送邮件
                client.Send(mail);
                return verifyCode;
            }
            catch (Exception e)
            {
                Console.Write(e);
            }
            return string.Empty;
        }
        public List<Admin> GetAdminList()
        {
            return _x.Admin.ToList();
        }
        public List<Roles> GetRoleList()
        {
            return _x.Roles.ToList();
        }
        public List<Permissions> GetRolePermissions(Guid roleId)
        {
            var role = _x.Roles.SingleOrDefault(item => item.RoleId == roleId);
            return role.Permissions.ToList();
        }
        public List<Users> GetUsersList()
        {
            return _x.Users.ToList();
        }
        //通过管理员表的UserId获取管理员基本信息
        public Users GetUserByAdminId(int userId)
        {
            return _x.Users.SingleOrDefault(item => item.UserId == userId);
        }
        public List<Roles> GetRoleList(int adminId)
        {
            try
            {
                var admin = _x.Admin.SingleOrDefault(item => item.AdminId == adminId);
                return admin.Roles.ToList();
            }
            catch
            {
                return null;
            }
        }
        //通过顾客ID获取DeliveryAddress表
        public List<DeliveryAddress> GetAllDeliveryAddressByCustomerId(int customerId)
        {
            return _x.DeliveryAddress.Where(item => item.CustomerId == customerId).ToList();
        }
        public DeliveryAddress GetDeliveryAddressByCustomerId(int customerId)
        {
            return _x.DeliveryAddress.Where(item => item.CustomerId == customerId).ToList().SingleOrDefault(item => item.Default == 1);
        }
        public Users GetUserByUserId(int userId)
        {
            return _x.Users.SingleOrDefault(item => item.UserId == userId);
        }
        //通过管理员Id获取管理员权限
        public List<Permissions> GetPermissionsByAdminId(int adminId)
        {
            var permisssions = _x.Permissions.Where(item => item.Admin.Any(m => m.AdminId == adminId)).ToList();
            var role = _x.Permissions.Where(item => item.Roles.Any(m => m.Admin.Any(q => q.AdminId == adminId))).ToList();
            return permisssions.Union(role).ToList();
        }
        //通过地址Id查找下单地址
        public DeliveryAddress GetDeliveryAddressByAddressId(int deliveryAddressId)
        {
            return _x.DeliveryAddress.SingleOrDefault(item => item.DeliveryAddressId == deliveryAddressId);
        }
        public void ChangeDefaultDeliveryAddress()
        {
            var defaultAddress = _x.DeliveryAddress.SingleOrDefault(item => item.Default == 1);
            defaultAddress.Default = 0;
            _x.SaveChanges();
        }
        public Users GetUserByCustomerId(int customerId)
        {
            return _x.Users.SingleOrDefault(item => item.Customers.Any(p => p.CustomerId == customerId));
        }
        public void ModifyCustomer(Users user)
        {
            var saveUser = GetUserByUserId(user.UserId);
            saveUser.UserName = user.UserName;
            saveUser.RealName = user.RealName;
            saveUser.Head = user.Head;
            saveUser.PhoneNumber = user.PhoneNumber;
            _x.SaveChanges();
        }
        public Permissions GetPermissionBypermissionsId(Guid permissionId)
        {
            return _x.Permissions.SingleOrDefault(item => item.PermissionId == permissionId);
        }
        public void EditAdminPermissions(List<Permissions> permissionId, int adminId)
        {
            var admin = _x.Admin.SingleOrDefault(item => item.AdminId == adminId);
            admin.Permissions.Clear();
            foreach (var item in permissionId)
            {
                var permissoin = GetPermissionBypermissionsId(item.PermissionId);
                admin.Permissions.Add(permissoin);
            }
            _x.SaveChanges();
        }
        public void AddRolePermissions(string RoleName, string RoleCode, List<Permissions> permissionId)
        {
            var role = new Roles()
            {
                RoleId = Guid.NewGuid(),
                Code = RoleCode,
                CreationTime = DateTime.Now,
                Name = RoleName,
            };
            foreach (var item in permissionId)
            {
                var permissoin = GetPermissionBypermissionsId(item.PermissionId);
                role.Permissions.Add(permissoin);
            }
            _x.Roles.Add(role);
            _x.SaveChanges();
        }
        public void EditRole(Guid roleId, string roleName, string roleCode)
        {
            var role = GetRoleByRoleId(roleId);
            role.Name = roleName;
            role.Code = roleCode;
            _x.SaveChanges();
        }
        public void EditRolePermissions(List<Permissions> permissionId, Guid roleId)
        {
            var role = _x.Roles.SingleOrDefault(item => item.RoleId == roleId);
            role.Permissions.Clear();
            foreach (var item in permissionId)
            {
                var permissoin = GetPermissionBypermissionsId(item.PermissionId);
                role.Permissions.Add(permissoin);
            }
            _x.SaveChanges();
        }
        public string ModifyPassword(int customerId, string password, string newPassword)
        {
            var user = GetUserByCustomerId(customerId);
            if (user.Password == password)
            {
                user.Password = newPassword;
                _x.SaveChanges();
                return "修改成功！";
            }
            else
            {
                return null;
            }
        }
        public Customers GetCustomerByCustomerId(int customerId)
        {
            return _x.Customers.SingleOrDefault(item => item.CustomerId == customerId);
        }
        public List<ShoppingCars> GetShoopingCar(int customerId)
        {
            var customer = GetCustomerByCustomerId(customerId);
            return customer.ShoppingCars.ToList();
        }
        public ShoppingCars GetShoopingCarByShoppingCarId(int shoppingCarId)
        {
            return _x.ShoppingCars.SingleOrDefault(item => item.ShoppingCarId == shoppingCarId);
        }
        public void DeleteShoppingCar(List<ShoppingCars> shoppingCarId, int customerId)
        {
            var customer = GetCustomerByCustomerId(customerId);
            foreach (var item in shoppingCarId)
            {
                var shoppingCar = GetShoopingCarByShoppingCarId(item.ShoppingCarId);
                _x.ShoppingCars.Remove(shoppingCar);
            }
            _x.SaveChanges();

        }
        public List<AdminLog> GetAdminLogsBySearch(string adminName)
        {
            try
            {
                var user = _x.Users.SingleOrDefault(item => item.UserName == adminName);
                if (user == null)
                {
                    return _x.AdminLog.ToList();
                }
                var admin = _x.Admin.SingleOrDefault(item => item.UserId == user.UserId);
                if (admin == null)
                {
                    return _x.AdminLog.ToList();
                }
                return admin.AdminLog.ToList();
            }
            catch
            {
                return _x.AdminLog.ToList();
            }
        }
        public List<AdminLog> GetAllAdminLog()
        {
            return _x.AdminLog.ToList();
        }
        public void AddEvaluation(string Evaluate, int orderId, int customerId)
        {
            Evaluation evaluation = new Evaluation()
            {
                CustomerId = customerId,
                Evaluate = Evaluate,
                OrderId = orderId,
            };
            _x.Evaluation.Add(evaluation);
            _x.SaveChanges();
        }
        public void Dispose()
        {
            _x.Dispose();
        }
    }
}
