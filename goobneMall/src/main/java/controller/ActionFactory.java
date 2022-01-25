package controller;

import controller.action.Action;
import controller.action.AddrAddAction;
import controller.action.AddrAddFormAction;
import controller.action.AddrDelAction;
import controller.action.AddrMoveAction;
import controller.action.AddrUpdateAction;
import controller.action.AddrUpdateFormAction;
import controller.action.AddrViewAction;
import controller.action.AllBuyAction;
import controller.action.BuyAction;
import controller.action.CartAction;
import controller.action.CartViewAction;
import controller.action.ChangeQntAction;
import controller.action.ChargingAction;
import controller.action.DVcompleteAction;
import controller.action.DelCartAction;
import controller.action.DeleteChkPwFormAction;
import controller.action.DeleteMemberAction;
import controller.action.MemberJoinAction;
import controller.action.MemberJoinFormAction;
import controller.action.MemberLoginAction;
import controller.action.MemberLoginFormAction;
import controller.action.MemberLogoutAction;
import controller.action.MoveOrderAction;
import controller.action.MyInfoChkPwFormAction;
import controller.action.MyInfoUpdateAction;
import controller.action.MyInfoUpdateFormAction;
import controller.action.MyPageAction;
import controller.action.NoticeDeleteAction;
import controller.action.NoticeListAction;
import controller.action.NoticeUpdateAction;
import controller.action.NoticeUpdateFormAction;
import controller.action.NoticeViewAction;
import controller.action.NoticeWriteAction;
import controller.action.NoticeWriteFormAction;
import controller.action.OrderAction;
import controller.action.OrderListAction;
import controller.action.ProductAction;
import controller.action.SearchAction;
import controller.action.SelectBuyAction;
import controller.action.SelectDelAction;
import controller.action.UploadAction;
import controller.action.allDelAction;

public class ActionFactory {

	//Factory Method
	//Command Pattern
	
	
	//single
	private ActionFactory() {}
	private static ActionFactory instance=new ActionFactory();
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public static Action createAction(String command) {
		if(command.equals("addCart")) return new CartAction();
		else if(command.equals("ChageQnt")) return new ChangeQntAction();
		else if(command.equals("delCart")) return new DelCartAction();
		else if(command.equals("search")) return new SearchAction();
		else if(command.equals("product")) return new ProductAction();
		else if(command.equals("cartView")) return new CartViewAction();
		else if(command.equals("order")) return new OrderAction();
		else if(command.equals("selectDel")) return new SelectDelAction();
		else if(command.equals("allDel")) return new allDelAction();
		else if(command.equals("selectBuy")) return new SelectBuyAction();
		else if(command.equals("allBuy")) return new AllBuyAction();
		else if(command.equals("mypage")) return new MyPageAction();
		else if(command.equals("addr")) return new AddrMoveAction();
		else if(command.equals("buy")) return new BuyAction();
		else if(command.equals("moveOrder")) return new MoveOrderAction();
		else if(command.equals("orderList")) return new OrderListAction();
		else if(command.equals("DVcomplete")) return new DVcompleteAction();
		else if(command.equals("upload")) return new UploadAction();
		else if(command.equals("charging")) return new ChargingAction();
		
		
		
		
		else if(command.equals("noticeList")) return new NoticeListAction();
		else if(command.equals("noticeView")) return new NoticeViewAction();
		else if(command.equals("noticeWriteForm")) return new NoticeWriteFormAction();
		else if(command.equals("noticeWrite")) return new NoticeWriteAction();
		else if(command.equals("noticeUpdateFrom")) return new NoticeUpdateFormAction();
		else if(command.equals("noticeUpdate")) return new NoticeUpdateAction();
		else if(command.equals("noticeDelete")) return new NoticeDeleteAction();
		else if(command.equals("memberJoinForm")) return new MemberJoinFormAction();
		else if(command.equals("memberJoin")) return new MemberJoinAction();
		else if(command.equals("memberLoginForm")) return new MemberLoginFormAction();
		else if(command.equals("memberLogin")) return new MemberLoginAction();
		else if(command.equals("memberLogout")) return new MemberLogoutAction();
		else if(command.equals("addrAdd")) return new AddrAddFormAction();
        else if(command.equals("addrAddAction")) return new AddrAddAction();
        else if(command.equals("addrDel")) return new AddrDelAction();
        else if(command.equals("addrUpdateForm")) return new AddrUpdateFormAction();
        else if(command.equals("addrUpdate")) return new AddrUpdateAction();
        else if(command.equals("addrView")) return new AddrViewAction();
        else if(command.equals("MyInfoChkPwForm")) return new MyInfoChkPwFormAction();
        else if(command.equals("MyInfoUpdateForm")) return new MyInfoUpdateFormAction();
        else if(command.equals("MyInfoUpdate")) return new MyInfoUpdateAction();
        else if(command.equals("DeleteChkPwForm")) return new DeleteChkPwFormAction();
        else if(command.equals("DeleteMember")) return new DeleteMemberAction();
		
		return null;
	}
}
