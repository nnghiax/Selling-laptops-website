<style>
    /*SIDEBAR*/
    #sidebar {
        grid-area: sidebar;
        height: 100%;
        background-color: #263043;
        overflow-y: auto;
        transition: all 0.5s;
        -webkit-transition: all 0.5s;
    }

    .sidebar-title {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 30px 30px 30px 30px;
        margin-bottom: 30px;
    }

    .sidebar-title > span {
        display: none;
    }

    .sidebar-brand {
        margin-top: 15px;
        font-size: 20px;
        font-weight: 700;
    }

    .sidebar-list {
        margin-top: 15px;
        padding: 0;
        list-style-type: none;
    }

    .sidebar-list-items {
        padding: 20px 20px 20px 20px;
        font-size: 18px;
        font-weight: 600;
    }

    .sidebar-item {
        font-size: 18px;
        font-weight: 600;
        color: #9e9ea4;
    }

    .sidebar-list-items:hover {
        background-color: rgba(255, 255, 255, 0.2);
        cursor: pointer;
    }

    .sidebar-list-items.active {
        background-color: rgba(255, 255, 255, 0.2);
        cursor: pointer;
    }

    .sidebar-responsive {
        display: inline !important;
        position: absolute;
        z-index: 12 !important;
    }
</style>


<aside id="sidebar">
    <div class="sidebar-title">
        <div class="sidebar-brand">

        </div>
    </div>
    <ul class="sidebar-list">
        <li class="sidebar-list-items active">
            <a href="dashboardservlet" class="sidebar-item">
                <span class="material-icons">category</span> Dashboard
            </a>
        </li>
        <li class="sidebar-list-items">
            <a href="manaProduct" class="sidebar-item">
                <span class="material-icons">inventory_2</span> Products
            </a>
        </li>
        <li class="sidebar-list-items">
            <a href="blistmanage" class="sidebar-item">
                <span class="material-icons">newspaper</span> Blogs
            </a>
        </li>
        <li class="sidebar-list-items">
            <a href="dashboard.jsp" class="sidebar-item">
                <span class="material-icons">laptop_mac</span> Sliders
            </a>
        </li>
        <li class="sidebar-list-items">
            <a href="customerdashboard" class="sidebar-item">
                <span class="material-icons">person</span> Customers
            </a>
        </li>
        <li class="sidebar-list-items">
            <a href="dashboard.jsp" class="sidebar-item">
                <span class="material-icons">chat</span> Feedbacks
            </a>
        </li>
        <li class="sidebar-list-items">
            <a href="manaCategory" class="sidebar-item">
                <span class="material-icons">view_cozy</span> Category
            </a>
        </li>
    </ul>
</aside>
