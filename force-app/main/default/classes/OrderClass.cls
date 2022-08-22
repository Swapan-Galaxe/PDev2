public class OrderClass {	
	public void CreateOrdersFromOpptys(List<Opportunity> opptyList) {
		List<contact> orderList = new List<contact>();
		for (Opportunity oppty : opptyList) {
			contact order = new contact();
			//more logic here
			orderList.add(order);
		}
		insert orderList ;
	}
}