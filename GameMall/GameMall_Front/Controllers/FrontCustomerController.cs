using GameMall_Data.Data;
using GameMall_Data.Service;
using GameMall_Front.ViewModels.Customer;
using GameMall_Front.ViewModels.Order;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GameMall_Front.Controllers
{
    public class FrontCustomerController : Controller
    {
        // GET: User
        UserService userService = new UserService();
        OrderService orderService = new OrderService();
        GoodsService goodsService = new GoodsService();

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string UserName, string Password)
        {
            var user = userService.Login(UserName, Password);
            var customer = userService.IfCustomer(user);
            if (customer != null)
            {
                Session.Add("CustomerId", customer.CustomerId);
                Session.Add("UserName",user.UserName);
                return Redirect("/Home/Index");
            }
            else
            {
                TempData["DataError"] = "账号或密码错误";
                return Redirect("/FrontCustomer/Login");
            }
        }
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(Users user)
        {
            userService.AddCustomer(user.UserName,user.Password);
            TempData["DataError"] = "注册成功！";
            return PartialView("Login");
        }
        public ActionResult Logout()
        {
            Session["CustomerId"] = null;
            Session["UserName"] = null;
            TempData["Logout"] = "注销成功！";
            return RedirectToAction("Login", "FrontCustomer");
        }
        
        public ActionResult MyMall()
        {
            var customerId = Session["CustomerId"];
            if (customerId == null)
            {
                TempData["IfLogin"]= "请登录！";
                return RedirectToAction("Index", "Home");
            }
            else
            {
                var user = userService.GetUserByCustomerId((int)customerId);
                ViewModelUsers userDTO = new ViewModelUsers()
                {
                    Head = user.Head,
                };
                return View(userDTO);
            }
        }
        public ActionResult ModifyNameOrHead()
        {
            var customerId = (int)Session["CustomerId"];
            var user = userService.GetUserByCustomerId(customerId);
            var userDTO = new ViewModelUsers()
            {
                Head = user.Head,
                PhoneNumber = user.PhoneNumber,
                RealName = user.RealName,
                UserId = user.UserId,
                UserName = user.UserName,
            };
            return View(userDTO);
        }
        [HttpPost]
        public ActionResult ModifyNameOrHead(ViewModelUsers user)
        {
            Users saveUser = new Users()
            {
                UserId = user.UserId,
                RealName = user.RealName,
                PhoneNumber = user.PhoneNumber,
                UserName = user.UserName,
                
            };
            if (user.Head == null)
            {
                var u = userService.GetUserByUserId(user.UserId);
                saveUser.Head = u.Head;
            }
            else
            {
                saveUser.Head = GetImageFromWeb();
            }
            userService.ModifyCustomer(saveUser);
            return RedirectToAction("MyMall");
        }
        public ActionResult AddressManagement(ViewModelDeliveryAddress address)
        {
            if(address == null)
            {
                ViewModelDeliveryAddress newAddress = new ViewModelDeliveryAddress() { CustomerId = address.CustomerId };
                return View(newAddress);
            }
            else
            {
                return View(address);
            }
        }
        [HttpPost]
        public ActionResult AddAddress(ViewModelDeliveryAddress address)
        {
            DeliveryAddress addAddress = new DeliveryAddress()
            {
                Area = address.Area,
                DeliveryAddressId = address.DeliveryAddressId,
                DetailAddress = address.DetailAddress,
                CustomerId = (int)Session["CustomerId"],
                Default = address.Default,
                DeliveryName = address.DeliveryName,
                Postcode = address.Postcode,
                Province = address.Province,
                Street = address.Street,
                TelNum = address.TelNum,
            };
            var customerId = (int)Session["CustomerId"];
            var allDeliveryAddress = userService.GetAllDeliveryAddressByCustomerId(customerId);
            if (allDeliveryAddress.Count != 0)
            {
                if (addAddress.Default == 1)
                {
                    userService.ChangeDefaultDeliveryAddress();
                }
            }
            userService.AddAddress(addAddress);
            return RedirectToAction("MyMall");
        }
        public ActionResult AddressList()
        {
            int customerId = (int)Session["CustomerId"];
            var allAddress = userService.GetAllDeliveryAddressByCustomerId(customerId);
            var allAddressDTO = allAddress.Select(item => new ViewModelDeliveryAddress
            {
                Area = item.Area,
                DeliveryAddressId = item.DeliveryAddressId,
                DetailAddress = item.DetailAddress,
                CustomerId = item.CustomerId,
                Default = item.Default,
                DeliveryName = item.DeliveryName,
                Postcode = item.Postcode,
                Province = item.Province,
                Street = item.Street,
                TelNum = item.TelNum,
            }).ToList();
            return View(allAddressDTO);
        }
        public ActionResult Favorite()
        {
            return View();
        }
        public ActionResult ModifyPassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ModifyPassword(string password,string newPassword)
        {
            var customerId = (int)Session["CustomerId"];
            var checkModify = userService.ModifyPassword(customerId, password, newPassword);
            if (checkModify == null)
            {
                TempData["TipModify"] = "原密码错误";
                return RedirectToAction("MyMall");
            }
            TempData["TipModify"] = "修改成功！";
            return RedirectToAction("MyMall");
        }
        public ActionResult ChooseDeliveryAddress()
        {
            var customerId = (int)Session["CustomerId"];
            var allDeliveryAddress = userService.GetAllDeliveryAddressByCustomerId(customerId);
            if (allDeliveryAddress.Count == 0)
            {
                return null;
            }
            var allDeliveryAddressDTO = allDeliveryAddress.Select(item => new ViewModelDeliveryAddress
            {
                Area = item.Area,
                CustomerId = item.CustomerId,
                Default = item.Default,
                DeliveryAddressId = item.DeliveryAddressId,
                DeliveryName = item.DeliveryName,
                Postcode = item.Postcode,
                Province = item.Province,
                DetailAddress = item.DetailAddress,
                Street = item.Street,
                TelNum = item.TelNum,
            }).ToList();
            return View(allDeliveryAddressDTO);
        }
        public ActionResult SureAddress()
        {
            var customerId = (int)Session["CustomerId"];
            var address = userService.GetAllDeliveryAddressByCustomerId(customerId);
            if (address.Count == 0)
            {
                return null;
            }
            var defaultAddress =  address.SingleOrDefault(item => item.Default == 1);
            var defaultAddressDTO = new ViewModelDeliveryAddress
            {
                Area = defaultAddress.Area,
                DeliveryAddressId = defaultAddress.DeliveryAddressId,
                DetailAddress = defaultAddress.DetailAddress,
                CustomerId = defaultAddress.CustomerId,
                Default = defaultAddress.Default,
                DeliveryName = defaultAddress.DeliveryName,
                Province = defaultAddress.Province,
                Street = defaultAddress.Street,
                Postcode = defaultAddress.Postcode,
                TelNum = defaultAddress.TelNum,
            };
            return View(defaultAddressDTO);
        }
        public ActionResult SureChoosedAddress(int addressId)
        {
            var address = userService.GetDeliveryAddressByAddressId(addressId);
            var addressDTO = new ViewModelDeliveryAddress
            {
                Area = address.Area,
                DeliveryAddressId = address.DeliveryAddressId,
                DetailAddress = address.DetailAddress,
                CustomerId = address.CustomerId,
                Default = address.Default,
                DeliveryName = address.DeliveryName,
                Province = address.Province,
                Street = address.Street,
                Postcode = address.Postcode,
                TelNum = address.TelNum,
            };
            return PartialView("SureAddress", addressDTO);
        }
        public ActionResult ShoppingCar()
        {
            if (Session["CustomerId"] == null)
            {
                TempData["IfLogin"] = "请登录！";
                return RedirectToAction("Index", "Home");
            }
            var customerId = (int)Session["CustomerId"];
            var shoppingCar =  userService.GetShoopingCar(customerId);
            var shoppingCarDTO = shoppingCar.Select(item => new ViewModelShoppingCars()
            {
                CustomerId = item.CustomerId,
                ShoppingCarGoodsNumber = item.ShoppingCarGoodsNumber,
                ShoppingCarId = item.ShoppingCarId,
                GoodsId = item.GoodsId,
                VersionId = item.VersionId,
            }).ToList();
            return View(shoppingCarDTO);
        }
        
        public ActionResult DeleteShopingCarGoods(string ShoppingCarIdStr)
        {
            var customerId = (int)Session["CustomerId"];
            var str = ShoppingCarIdStr.Split(',');
            var shoppingCars = new List<ShoppingCars>();
            foreach (var item in str)
            {
                var shoppingCarGoods = new ShoppingCars();
                shoppingCarGoods.ShoppingCarId = int.Parse(item);
                shoppingCars.Add(shoppingCarGoods);
            }
            userService.DeleteShoppingCar(shoppingCars, customerId);

            var shoppingCar = userService.GetShoopingCar(customerId);
            var shoppingCarDTO = shoppingCar.Select(item => new ViewModelShoppingCars()
            {
                CustomerId = item.CustomerId,
                ShoppingCarGoodsNumber = item.ShoppingCarGoodsNumber,
                ShoppingCarId = item.ShoppingCarId,
                GoodsId = item.GoodsId,
                VersionId = item.VersionId,
            }).ToList();

            return PartialView("ItemShoppingCar", shoppingCarDTO);
        }

        public string GetImageFromWeb()
        {
            HttpFileCollection uploadFille = System.Web.HttpContext.Current.Request.Files;
            string fileName = uploadFille[0].FileName;
            int fileSize = uploadFille[0].ContentLength;
            string fileExt = System.IO.Path.GetExtension(fileName).ToLower();
            if (!(fileExt == ".png" || fileExt == ".gif" || fileExt == ".jpg" || fileExt == ".jpeg"))
            {
                return "图片类型只能为gif png jpg jpeg";
            }
            else
            {
                if (fileSize > (int)(500 * 1024))
                {
                    return "图片不能超过500kb";
                }
                else
                {
                    string uploadFileName = DateTime.Now.ToString("yyyy-MM-dd HH.mm.ss") + fileExt;
                    try
                    {
                        string directoryPath = Server.MapPath("/Images/CustomerHead/");
                        if (!Directory.Exists(directoryPath))
                        {
                            Directory.CreateDirectory("/Images/CustomerHead/");
                            return "创建文件";
                        }
                        else
                        {
                            string filePath = "/Images/CustomerHead/";
                            string path = Request.MapPath(filePath + "/") + uploadFileName;
                            uploadFille[0].SaveAs(path);
                            return filePath + uploadFileName;
                        }
                    }
                    catch (Exception e)
                    {
                        return "上传异常";
                    }
                }
            }
        }

    }
}