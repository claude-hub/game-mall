using GameMall_Back.ViewModels.Order;
using GameMall_Data.Data;
using GameMall_Data.Service;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GameMall_Back.Controllers
{
    public class OrderController : Controller
    {
        OrderService orderService = new OrderService();
        WarehouseService warehouseService = new WarehouseService();
        // GET: Order
        public ActionResult OrderList()
        {
            return View();
        }

        public ActionResult SelectOrders(int orderStatu, string searchKey, int? page)
        {
            List<Orders> orders = new List<Orders>();
            if (orderStatu == 0)
            {
                orders = orderService.GetAllOrder();
            }
            else
            {
               orders = orderService.GetOrderByStatu(orderStatu);
            }
            var ordersDTO = orders.Select(item => new ViewModelOrder
            {
                CustomerId = item.CustomerId,
                GoodsId = item.GoodsId,
                OrderId = item.OrderId,
                Express = item.Express,
                OrderGoodsNumber = item.OrderGoodsNumber,
                OrderStatus = item.OrderStatus,
                OrderTime = item.OrderTime,
                Price = item.Price,
                SellerMessage = item.SellerMessage,
                DeliveryName = item.DeliveryName,
                Area = item.Area,
                DetailAddress = item.DetailAddress,
                GoodsName = item.GoodsName,
                Province = item.Province,
                Street = item.Street,
                TelNum = item.TelNum,
                VersionName = item.VersionName,
            }).ToList();

            var searchResult = ordersDTO
               .Where(u => u.GoodsName.Contains(searchKey)).ToList();
            int pageNumber = page ?? 1;
            int pageSize = 5;
            var list = searchResult.ToPagedList(pageNumber, pageSize);
            return View(list);
        }
        public ActionResult OrderDetail(int orderId)
        {
            var order = orderService.GetOrderByOrderId(orderId);
            var orderDTO = new ViewModelOrder()
            {
                OrderId = order.OrderId,
                CustomerId = order.CustomerId,
                DeliveryName = order.DeliveryName,
                DetailAddress = order.DetailAddress,
                Express = order.Express,
                GoodsId = order.GoodsId,
                GoodsName = order.GoodsName,
                OrderGoodsNumber = order.OrderGoodsNumber,
                OrderStatus = order.OrderStatus,
                OrderTime = order.OrderTime,
                Price = order.Price,
                Province = order.Province,
                SellerMessage = order.SellerMessage,
                Street = order.Street,
                TelNum = order.TelNum,
                VersionId = order.VersionId,
                VersionName = order.VersionName,
                Area = order.Area,
            };
            return View(orderDTO);
        }
        [HttpPost]
        public ActionResult OrderDetail(int orderId,int adminId)
        {
            //orderService.Delivery(orderId);
            orderService.CreateInvoice(orderId, adminId);
            return RedirectToAction("OrderList");
        }
        public ActionResult InvoiceList()
        {
            return View();
        }
        public ActionResult CheckIfSended(int orderId)
        {
            var order = orderService.GetOrderByOrderId(orderId);
            if (order.OrderStatus <= 2)
            {
                return View(orderId);
            }
            return null;
        }
        public ActionResult SelectInvoice(int? searchOrderId, int? page)
        {
            var invoice = orderService.GetAllInvoice();
            var invoiceDTO = invoice.Select(item => new ViewModelInvoice
            {
                InvoiceId = item.InvoiceId,
                OrderId = item.OrderId,
                AdminId = item.AdminId,
            }).ToList();
            var searchResult = new List<ViewModelInvoice>();
            if(searchOrderId == null)
            {
                searchResult = invoiceDTO;
            }
            else
            {
                searchResult= invoiceDTO.Where(item => item.OrderId == searchOrderId).ToList();
            }
            int pageNumber = page ?? 1;
            int pageSize = 5;
            var list = searchResult.ToPagedList(pageNumber, pageSize);
            return View(list);
        }
        public ActionResult InvoiceDetail(int invoiceId)
        {
            var invoice = orderService.GetInvoiceByInvoiceId(invoiceId);
            var invoiceDTO = new ViewModelInvoice()
            {
                InvoiceId = invoice.OrderId,
                AdminId = invoice.AdminId,
                OrderId = invoice.OrderId,
            };
            return View(invoiceDTO);
        }
        [HttpPost]
        public ActionResult InvoiceDetail(int orderId, int adminId)
        {
            var order = orderService.Delivery(orderId);
            StockLog log = new StockLog()
            {
                GoodsId = order.GoodsId,
                OperationRecord = "发货",
                AdminId = (int)Session["AdminId"],
                OperationTime = DateTime.Now,
                WarehouseId = order.WarehouseId,
                OrderId = order.OrderId,
                VersionId = order.VersionId,
                Stock = -1,
            };
            warehouseService.AddWarehouseLog(log);
            return RedirectToAction("InvoiceList");
        }
        public ActionResult OrderAndInvoice(int orderId)
        {
            var order = orderService.GetOrderByOrderId(orderId);
            var orderDTO = new ViewModelOrder()
            {
                OrderId = order.OrderId,
                CustomerId = order.CustomerId,
                DeliveryName = order.DeliveryName,
                DetailAddress = order.DetailAddress,
                Express = order.Express,
                GoodsId = order.GoodsId,
                GoodsName = order.GoodsName,
                OrderGoodsNumber = order.OrderGoodsNumber,
                OrderStatus = order.OrderStatus,
                OrderTime = order.OrderTime,
                Price = order.Price,
                Province = order.Province,
                SellerMessage = order.SellerMessage,
                Street = order.Street,
                TelNum = order.TelNum,
                VersionId = order.VersionId,
                VersionName = order.VersionName,
                Area = order.Area,
            };
            return View(orderDTO);
        }
    }
}