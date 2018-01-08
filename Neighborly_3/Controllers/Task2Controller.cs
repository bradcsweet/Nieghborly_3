using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Neighborly_3.Models;
using Microsoft.AspNet.Identity;

namespace Neighborly_3.Controllers
{
    [Authorize]
    public class Task2Controller : Controller
    {
        private FinalProjectEntities db = new FinalProjectEntities();

        // GET: Task2/Items Search and Sort
        public ActionResult Index(string search, string sort, int? id)
        {
            var items = from t in db.Task2
                        select t;

            if (!String.IsNullOrEmpty(search))
            {
                items = items.Where(t => t.TaskTitle.Contains(search)
                                       || t.TaskDescription.Contains(search));
            }

            if (sort == "Descending")
            {
                items = from item in items
                        orderby item.TimeStamp descending
                        select item;
            }
            else
            {
                items = from item in items
                        orderby item.TimeStamp ascending
                        select item;
            }

            //Identifies user based on log in
            ViewBag.userID = User.Identity.GetUserId();
            return View(items.ToList());
        }

        // GET: Task2/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Task2 task2 = db.Task2.Find(id);
            if (task2 == null)
            {
                return HttpNotFound();
            }

            AspNetUser taskUser = (from u in db.AspNetUsers
                           where u.Id == task2.TaskCreatorID
                           select u).Single();

            ViewBag.Address = taskUser.StreetAddress;
            ViewBag.UserName = taskUser.UserName;
            ViewBag.Email = taskUser.Email;
            return View(task2);
        }

        public ActionResult taskStatus(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Task2 item = db.Task2.Find(id);
            
            if (item.IsDone ?? false)
            {
                ViewBag.displayStatus = "No";
            }
            else
            {
                ViewBag.displayStatus = "Yes";
            }
            return RedirectToAction("Details");
        }

        // GET: Task2/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Task2/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TaskID,TaskDescription,TaskTitle,IsDone,TimeStamp,IsAssigned,HelpProviderID,TaskCreatorID")] Task2 task2)
        {
            if (ModelState.IsValid)
            {
                db.Task2.Add(task2);

                task2.IsAssigned = false;
                task2.IsDone = false;
                task2.TaskCreatorID = User.Identity.GetUserId();
                task2.TimeStamp = DateTime.Now;
                
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(task2);
        }
        public ActionResult ToggleDone(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Task2 item = db.Task2.Find(id);
            if (item == null)
            {
                return HttpNotFound();
            }
            if (item.IsDone.GetValueOrDefault(false))
            {
                item.IsDone = false;
            }
            else
            {
                item.IsDone = true;
            }

            db.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult AssignedToggleDone(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Task2 item = db.Task2.Find(id);
            if (item == null)
            {
                return HttpNotFound();
            }
            if (item.IsAssigned.GetValueOrDefault(false))
            {
                item.IsAssigned = false;
            }
            else
            {
                item.IsAssigned = true;
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }


// GET: Task2/Edit/5
public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Task2 task2 = db.Task2.Find(id);
            if (task2 == null)
            {
                return HttpNotFound();
            }
            //Identifies user who offers help
            ViewBag.userID = User.Identity.GetUserId();
            return View(task2);
        }

        // POST: Task2/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TaskID,TaskDescription,TaskTitle,IsDone,TimeStamp,IsAssigned,HelpProviderID,TaskCreatorID")] Task2 task2)
        {
            if (ModelState.IsValid)
            {
                db.Entry(task2).State = EntityState.Modified;
                task2.HelpProviderID = User.Identity.GetUserId();

                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(task2);
        }

        // GET: Task2/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Task2 task2 = db.Task2.Find(id);
            if (task2 == null)
            {
                return HttpNotFound();
            }
            return View(task2);
        }

        // POST: Task2/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Task2 task2 = db.Task2.Find(id);
            db.Task2.Remove(task2);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
