using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EainShinMaWebsite
{
    public partial class User1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
          
                LoadMainCards();
            }
        }
        private void LoadMainCards()
        {
            // Static data for the main cards
            var cardsHtml = @"
                <div class='card'>
                    <img src='/images/breakfast.jpg' alt='Adopt' class='card-image' />
                    <div class='card-content'>
                        <h3>Adopt</h3>
                        <p>Find a new furry friend to bring into your home. Many pets are waiting for a loving family.</p>
                        <a href='BreakfastMenu.aspx' class='btn'>Learn More</a>
                    </div>
                </div>
                <div class='card'>
                         <img src='/images/lunch.jpg' alt='Adopt' class='card-image' />
                    <div class='card-content'>
                        <h3>Volunteer</h3>
                        <p>Join our team of dedicated volunteers and help care for our pets. Your time and love make a difference!</p>
                        <a href='LunchMenu.aspx' class='btn'>Get Involved</a>
                    </div>
                </div>
                <div class='card'>
                         <img src='/images/dinner.jpg' alt='Adopt' class='card-image' />
                    <div class='card-content'>
                        <h3>Donate</h3>
                        <p>Support our shelter by making a donation. Your contributions help us provide the best care for our pets.</p>
                        <a href='DinnerMenu.aspx' class='btn'>Donate Now</a>
                    </div>
                </div>
                <div class='card'>
                          <img src='/images/dessert.jpg' alt='Adopt' class='card-image' />
                    <div class='card-content'>
                        <h3>Report</h3>
                        <p>If you see any pets in need or have concerns, let us know. We’re here to help and ensure their well-being.</p>
                        <a href='Dessets.aspx' class='btn'>Report Issue</a>
                    </div>
                </div>";

            MainCardsContainer.Text = cardsHtml;
        }




    }
}