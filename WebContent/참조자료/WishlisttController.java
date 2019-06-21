package egovframework.example.wishList;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.shop.service.ShopMainService;
import egovframework.example.wishList.service.WishService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class WishlisttController {
	
	@Resource(name="wishService")
	private WishService wishService;
	
	@Resource (name = "shopMainService")
	private ShopMainService shopMainService;
	//==========================위시리스트 불러오는 메소드==================================
	
	@RequestMapping(value = "wishlistt.do")
	public String initWishlistt(HttpServletRequest request, ModelMap model) throws Exception {
		
		try {
			
			String CusId = request.getParameter("Cusid");
			
			List<Map> selectWishItems = wishService.selectWishitems(CusId);
			
			Map<String, Object> setColors = new HashMap<String, Object>();
			
			setColors.put("ids", selectWishItems);
			
			List<Map> selectColors = wishService.selectColors(setColors);
			
			setColors.put("colIds", selectColors);
			
			List<Map> selectSize = wishService.selectSize(setColors);
			
			model.addAttribute("wishItems", selectWishItems);
			model.addAttribute("selectColors", selectColors);
			model.addAttribute("selectSize", selectSize);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "mypage/wishlistt.tiles";
	}
	//==========================위시리스트 추가하는 메소드==================================
	
	@RequestMapping(value = "addToWishAjax.do")
	public void addToCartAjax(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception {
		
		System.out.println("addToListAjax 컨트롤러호출");
		
	 	String loginId = request.getParameter("loginId");
        String selectedProductId = request.getParameter("selectedProductId");
        
        System.out.println("id :"+loginId+", selectedProductId :"+selectedProductId);
        
        PrintWriter out = null;
        out = response.getWriter();
        
        wishService.insertWish(loginId,selectedProductId);

    	out.write("addCartSuccess");
	}

	//==========================위시리스트 삭제하는 메소드==================================

	@RequestMapping(value = "wishDelete.do")
	public String initWishlisttdelete(HttpServletRequest request, ModelMap model) throws Exception {

		String[] wishDeleteId = request.getParameter("delCheck").split(",");
		String CusId = request.getParameter("Cusid");
		
		for(String check : wishDeleteId){
			System.out.println(check);
		}
		
		wishService.deleteWishitems(wishDeleteId);

		List<Map> selectWishItems = wishService.selectWishitems(CusId);
		
		model.addAttribute("wishItems", selectWishItems);
		return "mypage/wishlistt.tiles";
		
	} 
	
	//==========================위시리스트에서 카트로 옮기는 메소드==================================

	@RequestMapping(value = "wishToCart.do")
	public String initWishlisttmove(HttpServletRequest request, ModelMap model) throws Exception {

		String[] wishDeleteId = request.getParameter("delCheck").split(",");
		String CusId = request.getParameter("Cusid");
		String itemSize = request.getParameter("itemSize");
		
		wishService.deleteWishitems(wishDeleteId);

		List<Map> selectCartItems = wishService.selectCartItems(CusId);
		
		model.addAttribute("cartItems", selectCartItems);
		
		return "mypage/cartt.tiles";
		
	} 
	
	//==========================위시리스트 윙배너에 넣는 메소드==================================

	@RequestMapping(value = "getWishListToWingAjax.do")
	public void getWishListToWingAjax(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception {
		
		System.out.println(" getWishListToWingAjax 컨트롤러호출");
		
		String loginId = request.getParameter("loginId");
		
		System.out.println(loginId);
		PrintWriter out = null;
		
		List<Map> selectWishListToWing = wishService.selectWishListToWing(loginId);

		System.out.println(selectWishListToWing);
		
		out = response.getWriter();

		out.write(JsonUtil.ListToJson(selectWishListToWing));
		
		
		
	}
}
