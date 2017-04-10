using GameMall_Data.Data;
using GameMall_Data.Service;
using GameMall_Front.ViewModels.Customer;
using GameMall_Front.ViewModels.Goods;
using GameMall_Front.ViewModels.Order;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GameMall_Front.Controllers
{
    public class FrontOrderController : Controller
    {
        GoodsService goodsService = new GoodsService();
        UserService userService = new UserService();
        OrderService orderService = new OrderService();
        // GET: FrontOrder
        public ActionResult PlaceOrderByShoppingCar(string shoppingCarIdJsonStr, string goodsNumberJsonStr)
        {
            var shoppingCarIdList = shoppingCarIdJsonStr.Split(',');
            var goodsNumberList = goodsNumberJsonStr.Split(',');
            var orders = new List<ViewModelOrder>();
            for (int i = 0; i < shoppingCarIdList.Length; i++)
            {
                var anOrder = new ViewModelOrder();
                var shoppingCar = userService.GetShoopingCarByShoppingCarId(int.Parse(shoppingCarIdList[i]));
                var goods = goodsService.GetGoodsByGoodsId(shoppingCar.GoodsId);
                var version = goodsService.GetVersionByVersionId(shoppingCar.VersionId);
                anOrder.VersionId = shoppingCar.VersionId;
                anOrder.GoodsId = shoppingCar.GoodsId;
                anOrder.GoodsName = goods.GoodsName;
                anOrder.VersionName = version.VersionName;
                anOrder.Price = version.Price;
                anOrder.CustomerId = (int)Session["CustomerId"];

                anOrder.OrderGoodsNumber = int.Parse(goodsNumberList[i]);
                orders.Add(anOrder);
            }
            return View(orders);
        }
        [HttpPost]
        public ActionResult PlaceOrderByShoppingCar()
        {
            var customerId = (int)Session["CustomerId"];
            var form = Request.Form;
            var goodsIds = form.GetValues("GoodsId");
            var versionIds = form.GetValues("VersionId");
            var orderGoodsNumbers = form.GetValues("OrderGoodsNumber");
            var sellerMessage = form.GetValues("SellerMessage").First();
            var address = new DeliveryAddress();
            var deliveryAddressId = form.GetValues("DeliveryAddressId").First();
            if (deliveryAddressId != "")
            {
                address = userService.GetDeliveryAddressByAddressId(int.Parse(deliveryAddressId));
            }
            else
            {
                address = userService.GetDeliveryAddressByCustomerId(customerId);
            }
            var orderListDTO = new List<ViewModelOrder>();
            for (int i = 0; i < goodsIds.Length; i++)
            {
                var version = goodsService.GetVersionByVersionId(int.Parse(versionIds[i]));
                var goods = goodsService.GetGoodsByGoodsId(int.Parse(goodsIds[i]));
                Orders saveOrder = new Orders
                {
                    CustomerId = customerId,
                    GoodsId = goods.GoodsId,
                    GoodsName = goods.GoodsName,
                    OrderGoodsNumber = int.Parse(orderGoodsNumbers[i]),
                    VersionName = version.VersionName,
                    VersionId = int.Parse(versionIds[i]),
                    WarehouseId = version.WarehouseId,
                    Area = address.Area,
                    DeliveryName = address.DeliveryName,
                    DetailAddress = address.DetailAddress,
                    Province = address.Province,
                    TelNum = address.TelNum,
                    Street = address.Street,

                    OrderTime = DateTime.Now,
                    Price = version.Price,
                    OrderStatus = 0,
                    //Express = order.Express,
                    SellerMessage = sellerMessage,
                };
                orderService.SaveOrder(saveOrder);
                ViewModelOrder orderDTO = new ViewModelOrder
                {
                    OrderId = saveOrder.OrderId
                };
                orderListDTO.Add(orderDTO);
            }
            return PartialView("PayAll", orderListDTO);
        }
        [HttpPost]
        public ActionResult PayAll()
        {
            var form = Request.Form;
            var orderIds = form.GetValues("OrderId");
            foreach(var item in orderIds)
            {
                orderService.Pay(int.Parse(item));
            }
            return PartialView("PaySuccess");
        }

        public ActionResult PlaceOrder(int goodsId,int orderGoodsNumber, int VersionId)
        {
            if(Session["CustomerId"] == null)
            {
                TempData["IfLogin"] = "请登录！";
                return RedirectToAction("GoodsDetail", "FrontGoods", new { goodsId });
            }
            var goods = goodsService.GetGoodsByGoodsId(goodsId);
            var version = goodsService.GetVersionByVersionId(VersionId);

            ViewModelOrder orderDTO = new ViewModelOrder
            {
                CustomerId = (int)Session["CustomerId"],
                GoodsId = goods.GoodsId,
                GoodsName = goods.GoodsName,
                OrderGoodsNumber = orderGoodsNumber,
                Price = version.Price,
                VersionName = version.VersionName,
                VersionId = VersionId,
            };
            return View(orderDTO);
        }
        [HttpPost]
        public ActionResult PlaceOrder(ViewModelOrder order, ViewModelDeliveryAddress deliveryAddress)
        {
            var customerId = (int)Session["CustomerId"];
            var address = userService.GetDeliveryAddressByAddressId(deliveryAddress.DeliveryAddressId);
            var version = goodsService.GetVersionByVersionId(order.VersionId);
            var goods = goodsService.GetGoodsByGoodsId(order.GoodsId);
            if(address == null)
            {
                var defaultAddress = userService.GetDeliveryAddressByCustomerId(customerId);
                if (defaultAddress == null)
                {
                    TempData["TipModify"] = "请添加收货地址！！！";
                    return Redirect("/FrontCustomer/MyMall");
                }
                address = defaultAddress;
            }
            Orders saveOrder = new Orders
            {
                CustomerId = customerId,
                GoodsId = goods.GoodsId,
                GoodsName = goods.GoodsName,
                OrderGoodsNumber = order.OrderGoodsNumber,
                VersionName = version.VersionName,
                VersionId = order.VersionId,
                WarehouseId = version.WarehouseId,
                Area = address.Area,
                DeliveryName = address.DeliveryName,
                DetailAddress = address.DetailAddress,
                Province = address.Province,
                TelNum = address.TelNum,
                Street = address.Street,

                OrderTime = DateTime.Now,
                Price = version.Price,
                OrderStatus = 0,
                Express = order.Express,
                SellerMessage = order.SellerMessage,
            };  
            orderService.SaveOrder(saveOrder);
            ViewModelOrder orderDTO = new ViewModelOrder
            {
                OrderId = saveOrder.OrderId
            };
            return PartialView("Pay", orderDTO);
        }
        [HttpPost]
        public ActionResult Pay(int orderId)
        {
            orderService.Pay(orderId);
            return PartialView("PaySuccess");
        }
        public ActionResult AllOrder()
        {
            var customerId = (int)Session["CustomerId"];
            var allOrder = orderService.GetOrderByCustomerId(customerId);
            var allOrderDTO = allOrder.Select(item => new ViewModelOrder
            {
                Area = item.Area,
                Express = item.Express,
                DetailAddress = item.DetailAddress,
                CustomerId = customerId,
                DeliveryName = item.DeliveryName,
                GoodsId = item.GoodsId,
                TelNum = item.TelNum,
                GoodsName = item.GoodsName,
                OrderGoodsNumber = item.OrderGoodsNumber,
                OrderId = item.OrderId,
                OrderStatus = item.OrderStatus,
                OrderTime = item.OrderTime,
                Price = item.Price,
                Province = item.Province,
                SellerMessage = item.SellerMessage,
                Street = item.Street,
                VersionName = item.VersionName,
                VersionId = item.VersionId,
                WarehouseId = item.WarehouseId,
            }).ToList();
            return View(allOrderDTO);
        }
        public ActionResult Confirm(int orderId)
        {
            orderService.ConfirmReceipt(orderId);
            return PartialView("Evaluate",orderId);
        }
        public ActionResult Evaluate(int orderId)
        {
            return View(orderId);
        }
        [HttpPost]
        public ActionResult Evaluate(string Evaluate, int orderId)
        {
            var customerId = (int)Session["CustomerId"];
            orderService.Evaluate(orderId);
            userService.AddEvaluation(Evaluate,orderId,customerId);
            return RedirectToAction("MyMall","FrontCustomer");
        }
        public ActionResult PendingPayment()
        {
            var customerId = (int)Session["CustomerId"];
            var PendingPaymentOrder = orderService.GetOrderByCustomerId(customerId).Where(item => item.OrderStatus == 0);
            var PendingPaymentOrderDTO = PendingPaymentOrder.Select(item => new ViewModelOrder
            {
                Area = item.Area,
                Express = item.Express,
                DetailAddress = item.DetailAddress,
                CustomerId = customerId,
                DeliveryName = item.DeliveryName,
                GoodsId = item.GoodsId,
                TelNum = item.TelNum,
                GoodsName = item.GoodsName,
                OrderGoodsNumber = item.OrderGoodsNumber,
                OrderId = item.OrderId,
                OrderStatus = item.OrderStatus,
                OrderTime = item.OrderTime,
                Price = item.Price,
                Province = item.Province,
                SellerMessage = item.SellerMessage,
                Street = item.Street,
                VersionName = item.VersionName,
                VersionId = item.VersionId,
            }).ToList();
            return View(PendingPaymentOrderDTO);
        }
        public ActionResult WaiteDelivery()
        {
            var customerId = (int)Session["CustomerId"];
            var WaiteDeliveryOrder = orderService.GetOrderByCustomerId(customerId).Where(item => item.OrderStatus == 2);
            var WaiteDeliveryOrderDTO = WaiteDeliveryOrder.Select(item => new ViewModelOrder
            {
                Area = item.Area,
                Express = item.Express,
                DetailAddress = item.DetailAddress,
                CustomerId = customerId,
                DeliveryName = item.DeliveryName,
                GoodsId = item.GoodsId,
                TelNum = item.TelNum,
                GoodsName = item.GoodsName,
                OrderGoodsNumber = item.OrderGoodsNumber,
                OrderId = item.OrderId,
                OrderStatus = item.OrderStatus,
                OrderTime = item.OrderTime,
                Price = item.Price,
                Province = item.Province,
                SellerMessage = item.SellerMessage,
                Street = item.Street,
                VersionName = item.VersionName,
                VersionId = item.VersionId,
            }).ToList();
            return View(WaiteDeliveryOrderDTO);
        }
        public ActionResult ReceiveGoods()
        {
            var customerId = (int)Session["CustomerId"];
            var allOrder = orderService.GetOrderByCustomerId(customerId).Where(item => item.OrderStatus == 3);
            var allOrderDTO = allOrder.Select(item => new ViewModelOrder
            {
                Area = item.Area,
                Express = item.Express,
                DetailAddress = item.DetailAddress,
                CustomerId = customerId,
                DeliveryName = item.DeliveryName,
                GoodsId = item.GoodsId,
                TelNum = item.TelNum,
                GoodsName = item.GoodsName,
                OrderGoodsNumber = item.OrderGoodsNumber,
                OrderId = item.OrderId,
                OrderStatus = item.OrderStatus,
                OrderTime = item.OrderTime,
                Price = item.Price,
                Province = item.Province,
                SellerMessage = item.SellerMessage,
                Street = item.Street,
                VersionName = item.VersionName,
                VersionId = item.VersionId,
            }).ToList();
            return View(allOrderDTO);
        }
        public ActionResult PendingEvaluation()
        {
            var customerId = (int)Session["CustomerId"];
            var allOrder = orderService.GetOrderByCustomerId(customerId).Where(item => item.OrderStatus == 4);
            var allOrderDTO = allOrder.Select(item => new ViewModelOrder
            {
                Area = item.Area,
                Express = item.Express,
                DetailAddress = item.DetailAddress,
                CustomerId = customerId,
                DeliveryName = item.DeliveryName,
                GoodsId = item.GoodsId,
                TelNum = item.TelNum,
                GoodsName = item.GoodsName,
                OrderGoodsNumber = item.OrderGoodsNumber,
                OrderId = item.OrderId,
                OrderStatus = item.OrderStatus,
                OrderTime = item.OrderTime,
                Price = item.Price,
                Province = item.Province,
                SellerMessage = item.SellerMessage,
                Street = item.Street,
                VersionName = item.VersionName,
                VersionId = item.VersionId,
            }).ToList();
            return View(allOrderDTO);
        }
        public ActionResult OrderDetail(int orderId)
        {
            var order = orderService.GetOrderByOrderId(orderId);
            var orderDTO = new ViewModelOrder()
            {
                Area=order.Area,
                Express=order.Express,
                GoodsId=order.GoodsId,
                GoodsName=order.GoodsName,
                OrderGoodsNumber=order.OrderGoodsNumber,
                OrderId=order.OrderId,
                OrderStatus=order.OrderStatus,
                OrderTime=order.OrderTime,
                Price=order.Price,
                Province=order.Province,
                SellerMessage=order.SellerMessage,
                Street=order.Street,
                TelNum=order.TelNum,
                VersionId=order.VersionId,
                DetailAddress=order.DetailAddress,
                CustomerId=order.CustomerId,
                DeliveryName=order.DeliveryName,
                VersionName=order.VersionName,
                WarehouseId=order.WarehouseId,
            };
            return View(orderDTO);
        }    
    }
}