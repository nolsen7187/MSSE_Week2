using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data;
using System.Linq;
using FFR;

namespace FFR_Test
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void AddCustomerandSaleHeader()
        {
            FFREntities ffrDb = new FFREntities();

            Customer customer = new Customer();
            customer.CustomerId = 1;
            customer.FirstName = "Nick";
            customer.LastName = "Olsen";
            customer.City = "Parker";
            customer.State = "CO";
            customer.Zip = "80134";
            //Need to Add Street Name and Suite Fields
            customer.Address = customer.FirstName + " " + customer.LastName + "11321 Lovage Way " + customer.City + ", " + customer.State + " " + customer.Zip;
            customer.Phone = "3037181336";
            customer.Email = "nolsen@regis.edu";

            ffrDb.Customers.Add(customer);
            ffrDb.SaveChanges();

            SalesHeader salesHeader = new SalesHeader();

            salesHeader.CustomerId = customer.CustomerId;
            salesHeader.SalesStatus = "Open";
            salesHeader.OrderSalesBalance = 50;
            salesHeader.OrderTaxAmount = 5;
            salesHeader.OrderTotal = salesHeader.OrderSalesBalance + salesHeader.OrderTaxAmount;

            ffrDb.SalesHeaders.Add(salesHeader);
            ffrDb.SaveChanges();
        }
        [TestMethod]
        public void TestMethod1()
        {
            FFREntities ffrDb = new FFREntities();

            Customer savedCustomer = (from d in ffrDb.Customers where d.CustomerId == 1 select d).Single();

            Assert.AreEqual(savedCustomer.CustomerId, 1);
        }
        [TestMethod]
        public void DeleteSalesHeader()
        {
            FFREntities ffrDb = new FFREntities();

            SalesHeader salesHeader = new SalesHeader();
            salesHeader.SalesId = 1;
            salesHeader.SalesStatus = "Delete";
            salesHeader.OrderSalesBalance = 50;
            salesHeader.OrderTaxAmount = 5;
            salesHeader.OrderTotal = salesHeader.OrderSalesBalance + salesHeader.OrderTaxAmount;

            ffrDb.SalesHeaders.Add(salesHeader);
            ffrDb.SaveChanges();

            SalesHeader deleteSalesHeader = (from d in ffrDb.SalesHeaders where d.SalesId == 1 select d).Single();
            ffrDb.SalesHeaders.Remove(deleteSalesHeader);
            ffrDb.SaveChanges();
        }
        [TestMethod]
        public void UpdateSalesHeader()
        {
            FFREntities ffrDb = new FFREntities();

            SalesHeader salesHeader = new SalesHeader();
            salesHeader.SalesId = 2;
            salesHeader.CustomerId = 1;
            salesHeader.SalesStatus = "Update";
            salesHeader.OrderSalesBalance = 50;
            salesHeader.OrderTaxAmount = 5;
            salesHeader.OrderTotal = salesHeader.OrderSalesBalance + salesHeader.OrderTaxAmount;

            ffrDb.SalesHeaders.Add(salesHeader);
            ffrDb.SaveChanges();

            SalesHeader updateSalesHeader = (from d in ffrDb.SalesHeaders where d.SalesId == 2 select d).Single();
            updateSalesHeader.SalesStatus = "Record has been updated!";
            ffrDb.SaveChanges();
        }
    }
}
