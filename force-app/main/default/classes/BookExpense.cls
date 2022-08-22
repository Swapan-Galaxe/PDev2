public with sharing class BookExpense{
 public List<ConvertedExpenses> allConvertedExpenses{set; get;}
 
 public BookExpense(){
  List<Book__c> allBooks = [SELECT ID, Name, Price__c FROM Book__c];
  
  if(allBooks .size() > 0)
  {
       allConvertedExpenses = new List<ConvertedExpenses>();
       for(Book__c singleExpense: allBooks ){
        allConvertedExpenses.add(new ConvertedExpenses(singleExpense));
   }
  }
 }
 
 public class ConvertedExpenses{
 
  private Double DOLLAR_INR = 63.7847;
  private Double DOLLAR_EURO = 0.894601;
  private Double DOLLAR_CHF = 0.927985;
  
  public String expenseName {get;set;}
  public Double expenseInDollar {get;set;}
  public Double expenseInInr {get;set;}
  public Double expenseInEuro {get;set;}
  public Double expenseInChf {get;set;}
  
  public ConvertedExpenses(Book__c singleExpense){
   expenseName = singleExpense.Name;
   expenseInDollar = singleExpense.Price__c;
   expenseInInr = expenseInDollar * DOLLAR_INR;
   expenseInEuro = expenseInDollar * DOLLAR_EURO;
   expenseInChf = expenseInDollar * DOLLAR_CHF;
  }
 }
}