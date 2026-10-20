<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EainShinMaWebsite.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Hero Section -->
    <section id="hero" class="hero section light-background">

      <div class="container">
        <div class="row gy-4 justify-content-center justify-content-lg-between">
          <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
            <h3 data-aos="fade-up">အဟာရရှိသောအစားအစာများအကြောင်းလေ့လာကြရအောင်<br></h3>
            <p data-aos="fade-up" data-aos-delay="100">ကျန်းမာရေးအတွက် အကျိုးရှိသော အစားအစာများ ရှာဖွေကြည့်ရှုရန်

ဗီတာမင်များ အကြောင်း လေ့လာရန်

ကောင်းသောအစားအစာများ၊ မကောင်းသောအစားအစာများ ခွဲခြားနိုင်ရန်

လွယ်ကူသော အစားအစာချက်ပြုတ်နည်းများ သင်ယူနိုင်ရန်

ကျန်းမာရေးကို စိတ်ဝင်စားသူများ၊ အစားအသောက်ချစ်သူများ၊ အစားအစာအလေ့အထ တိုးတက်ချင်သူများ အတွက် လေ့လာသင်ယူရန်</p>
            <div class="d-flex" data-aos="fade-up" data-aos-delay="200">
              <a href="UserVitamin.aspx" class="btn-get-started">ဗီတာမင်အုပ်စုများ</a>

            <%--  --%>
             
            </div>
          </div>
          <div class="col-lg-5 order-1 order-lg-2 hero-img" data-aos="zoom-out">
            <img src="assets/img/hero-img.png" class="img-fluid animated" alt="">
               <%--   <img src="assets/img/f2.jpg" class="img-fluid animated" alt="">--%>
          </div>
        </div>
      </div>

    </section><!-- /Hero Section -->




    
    <!-- About Section -->
    <section id="about" class="about section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <p><span>အိမ်တွင်းချက်ပြုတ်ချင်းဖြင့်</span> <span class="description-title">ကျန်းမာရေးထိန်းသိမ်းခြင်း</span></p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">
          <div class="col-lg-7" data-aos="fade-up" data-aos-delay="200">
            <img src="assets/img/ert.jpg" class="img-fluid mb-4" alt="" style="width:800px; height:500px;display:block; margin:0 auto; border:2px solid #000;">
              
          </div>
          <div class="col-lg-5" data-aos="fade-up" data-aos-delay="250">
            <div class="content ps-0 ps-lg-5">
              <p >
                အိမ်မှာ ကျန်းမာစွာချက်ပြုတ်ခြင်းသည် ကျွန်တော်တို့ရဲ့ ကျန်းမာရေးကို ထိန်းသိမ်းရာတွင် အရေးကြီးသော နည်းလမ်းတစ်ခုဖြစ်သည်။ သန့်ရှင်းစွာ ချက်ပြုတ်ခြင်းနှင့် လိုအပ်သလို အာဟာရကို ထည့်သွင်းခြင်းကြောင့် ကိုယ်အလေးချိန်ထိန်းသိမ်းနိုင်ပြီး ကိုယ်ခံအား မြှင့်တင်နိုင်သည်။ ထို့အပြင် ရောဂါကာကွယ်နိုင်စွမ်းကို တိုးတက်စေပြီး မိသားစုအားလုံးအတွက် အာဟာရပြည့်ဝစွာ စားသောက်နိုင်ခြင်းကို ပေးစွမ်းသည်။
              </p>
              <ul>
                <li><i class="bi bi-check-circle-fill"></i> <span>ချက်ပြုတ်ပစ္စည်းများကို သန့်ရှင်းစွာအသုံးပြုခြင်း ချက်ပြုတ်မည့် စားစရာများ သန့်ရှင်းမှုရှိအောင်အသုံးပြုခြင်း</span></li>
                <li><i class="bi bi-check-circle-fill"></i> <span>အမျိုးအစားအစားအစာကို ညီမျှစွာ ထည့်သွင်းခြင်း ဟင်းသီးဟင်းရွက်၊ ငါးနှင့် အသားကို ညီမျှစွာ စားသုံးခြင်း</span></li>
                <li><i class="bi bi-check-circle-fill"></i> <span>ဆားနှင့် ဆီစသည့်အရာများ လျော့သုံးခြင်း၊ အနည်းဆုံး သုံး၍ ကျန်းမာရေးထိန်းသိမ်းနိုင်ခြင်း</span></li>
              </ul>
              <p>
                 အိမ်စားချက်ပြုတ်မှုသည် ကျန်းမာစွာဖြစ်လာပြီး မိသားစုအတွက် လုံခြုံပြီး အာဟာရပြည့်ဝသော အစားအစာများကို ပေးနိုင်မည်ဖြစ်သည်။
              </p>

           
            </div>
          </div>
        </div>

      </div>

    </section><!-- /About Section -->

    

</asp:Content>
