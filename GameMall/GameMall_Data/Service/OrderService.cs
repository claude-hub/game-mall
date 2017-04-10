using GameMall_Data.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GameMall_Data.Service
{
    public class OrderService
    {
        private GameMallDBContext _x;
        public OrderService()
        {
            _x = new GameMallDBContext();
        }
        public List<Orders> GetAllOrder()
        {
            return _x.Orders.ToList();
        }
        public List<Orders> GetOrderByStatu(int statu)
        {
            return _x.Orders.Where(item => item.OrderStatus == statu).ToList();
        }
        public List<Orders> GetOrderByCustomerId(int customerId)
        {
            return _x.Orders.Where(item => item.CustomerId == customerId).ToList();
        }
        public void SaveOrder(Orders order)
        {
            _x.Orders.Add(order);
            _x.SaveChanges();
        }
        public void Pay(int orderId)
        {
            var changeOrderStatus = GetOrderByOrderId(orderId);
            changeOrderStatus.OrderStatus = 1;
            _x.SaveChanges();
        }
        public Orders GetOrderByOrderId(int orderId)
        {
            return _x.Orders.SingleOrDefault(item => item.OrderId == orderId);
        }
        public void ConfirmReceipt(int orderId)
        {
            var order = _x.Orders.SingleOrDefault(item => item.OrderId == orderId);
            order.OrderStatus = 4;
            _x.SaveChanges();
        }
        public void Evaluate(int orderId)
        {
            var order = _x.Orders.SingleOrDefault(item => item.OrderId == orderId);
            order.OrderStatus = 5;
            _x.SaveChanges();
        }
        public Invoice GetInvoiceByInvoiceId(int invoiceId)
        {
            return _x.Invoice.SingleOrDefault(item => item.InvoiceId == invoiceId);
        }
        public void CreateInvoice(int orderId, int adminId)
        {
            var order = GetOrderByOrderId(orderId);
            order.OrderStatus = 2;
            Invoice invocie = new Invoice()
            {
                AdminId = adminId,
                OrderId = orderId,
            };
            _x.Invoice.Add(invocie);
            _x.SaveChanges();
        }
        public List<Invoice> GetAllInvoice()
        {
            return _x.Invoice.ToList();
        }
        public Orders Delivery(int orderId)
        {
            var order = GetOrderByOrderId(orderId);
            _x.Goods.SingleOrDefault(item => item.GoodsId == order.GoodsId).TotalSales += 1;
            var version = _x.Versions.SingleOrDefault(item => item.VersionId == order.VersionId);
            version.SalesVolume += 1;
            version.Stock -= 1;
            order.OrderStatus = 3;
            _x.SaveChanges();
            return order;
        }
    }
}
