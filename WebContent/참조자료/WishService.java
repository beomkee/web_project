package egovframework.example.wishList.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface WishService {

	void insertWish(String loginId, String selectedProductId)throws Exception;

	List<Map> selectWishitems(String cusId) throws Exception;

	List<Map> selectWishListToWing(String loginId) throws Exception;

	void deleteWishitems(String[] wishDeleteId) throws Exception;

	List<Map> selectCartItems(String cusId) throws Exception;

	List<Map> selectColors(Map<String, Object> setColors) throws Exception;

	List<Map> selectSize(Map<String, Object> setColors) throws Exception;
}

