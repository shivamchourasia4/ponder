package servlets;


import java.util.regex.*;
import java.sql.*;

public class Dbcon {
	
	// ------In development connection..
//	private static String url = "jdbc:mysql://localhost:3306/ponder";    
//    private static String driverName = "com.mysql.cj.jdbc.Driver";   
//    private static String username = "root";   
//    private static String password = "root";
//    private static Connection connection = null ;
//    private static String urlstring;
    
	//---Remote connection
    private static String url = "jdbc:mysql://remotemysql.com:3306/xTXmxFxUsE";    
    private static String driverName = "com.mysql.cj.jdbc.Driver";   
    private static String username = "xTXmxFxUsE";   
    private static String password = "YPrewEW7ZC";
    private static Connection connection = null ;
//    private static String urlstring;

    
    //Connect to database
    public static void getConnection() {
        try {
            Class.forName(driverName);
            try {
                connection = DriverManager.getConnection(url, username, password);
            } catch (SQLException ex) {
                // log an exception. fro example:
                System.out.println("Failed to create the database connection."); 
            }
        } catch (ClassNotFoundException ex) {
            // log an exception. for example:
            System.out.println("Driver not found."); 
        }
    }
    
    
    //login attempt
    public String TryLogin(String username,String password) throws SQLException 
    {		
    	getConnection();
    	String query = "SELECT password FROM info WHERE username = ?";
		PreparedStatement preparedStatement = connection.prepareStatement(query);
		preparedStatement.setString(1, username);
		ResultSet rs = preparedStatement.executeQuery();
		 if (rs.next() == false) {
		      //user not registered
			 return "Incorrect Username/Email or Password!";
		      
		      } else 
		      {
		          String data = rs.getString(1);
		          if(!data.equals(password)) {
		        	  //incorrect password
		        	  return "Incorrect Password!";
		        	  
		          }
		          else {
		        	  //login success...
		        	  return "ValidUser";
		        	  
		          }
		      }
    }
    
    public void PostStuff(String post,String topic,String user) throws SQLException
    {
    	
    	getConnection();
    	String postupdate="insert into posts_storage(dt, username,topic) values (now(),?,?)";
    	PreparedStatement preparedStatement = connection.prepareStatement(postupdate);
    	preparedStatement.setString(1, user);
    	preparedStatement.setString(2, topic);
    	int rowsaffected = preparedStatement.executeUpdate();
    	
    	if(rowsaffected==1)
    	{
    		String getpid = "select @p_id:=MAX(posts_id) from posts_storage";
    		preparedStatement = connection.prepareStatement(getpid);
    		preparedStatement.executeQuery();
//    		int id=0;
//    		if (rSet.next())
//    		{
//    			id = rSet.getInt(1);
//			}
    		String postdata = "insert into posts values(@p_id, ?)";
    		preparedStatement = connection.prepareStatement(postdata);
    		preparedStatement.setString(1, post);
    		
    		preparedStatement.executeUpdate();
    	}
    }
    
    
    public ResultSet Fetchponders() throws SQLException
    {
    	getConnection();
    	String getcontent = " select posts_storage.dt, posts_storage.username, posts_storage.topic, posts.post from posts_storage inner join posts on posts_storage.posts_id=posts.post_id order by posts_storage.dt desc";
    	Statement statement = connection.createStatement();
    	ResultSet resultSet = statement.executeQuery(getcontent);
    	return resultSet;
    }
    
    public ResultSet Searchtopic(String srctopic) throws SQLException {
    	getConnection();
    	
    	String getSearchResults = "select posts_storage.dt, posts_storage.username, posts_storage.topic, posts.post from posts_storage inner join posts on posts_storage.posts_id=posts.post_id where topic like '%"+srctopic+"%' order by posts_storage.dt desc";
    	Statement statement = connection.createStatement();
    	ResultSet resultSet = statement.executeQuery(getSearchResults);
    	return resultSet;
    }
    
    public ResultSet ShowMyposts(String itspost) throws SQLException {
    	getConnection();
    	
    	String getSearchResults = "select posts_storage.dt, posts_storage.username, posts_storage.topic, posts.post from posts_storage inner join posts on posts_storage.posts_id=posts.post_id where username='"+itspost+"' order by posts_storage.dt desc";
    	Statement statement = connection.createStatement();
    	ResultSet resultSet = statement.executeQuery(getSearchResults);
    	return resultSet;
    }
    
    
    
    
    
   public boolean isvalid(Pattern pat,Matcher mat) {
		return mat.matches();
	}
  
    public String Allchecks(Profile reg) throws SQLException
    {
    	getConnection();
    	Pattern pat;
    	Matcher mat;
    	String query = "select username from info where username=?";
		PreparedStatement preparedStatement = connection.prepareStatement(query);
		preparedStatement.setString(1, reg.username);
		ResultSet rs = preparedStatement.executeQuery();
    	if(!rs.next()==false)
    	{
    		return "Username already taken!";
    	}    	
    	
		pat = Pattern.compile("^[a-zA-Z]{1,30}");
		mat = pat.matcher(reg.firstname);
		if(!isvalid(pat, mat))
		{
			return "Invalid Last Name! Last name must be less than 30 characters and composed of alphabets";
		}
		mat = pat.matcher(reg.lastname);
		if(!isvalid(pat, mat))
		{
			return "Invalid First Name! First name must be less than 30 characters and composed of alphabets";
		}
		pat = Pattern.compile("^[a-z._]+{3,30}");
		mat = pat.matcher(reg.username);
		if(!isvalid(pat, mat))
		{
			return "Invalid Username! Username must be of 3-30 characters long and must only contain lowarcase alphabets, periods(.) and underscores(_).";
		}		
		pat = Pattern.compile("^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})");
		mat = pat.matcher(reg.email);
		if(!isvalid(pat, mat))
		{
			return "Invalid Email address!";
		}
		pat = Pattern.compile("[a-zA-Z0-9.-_+,!@|#$%()=]+{6,30}");
		mat = pat.matcher(reg.password);
		if(!isvalid(pat, mat))
		{
			return "Password must be betwen 6-30 characters and can contain only alphabets numbers and (.-_+,!@|#$%()=)";
		}	
		
		
		//Adding user all valid!!
		query = "insert into info values(?,?,?,?,?)";
		preparedStatement = connection.prepareStatement(query);
		preparedStatement.setString(1, reg.username);
		preparedStatement.setString(2, reg.firstname);
		preparedStatement.setString(3, reg.lastname);
		preparedStatement.setString(4, reg.email);
		preparedStatement.setString(5, reg.password);
		
		preparedStatement.executeUpdate();
	 return "ok";

    }
    
}

class Profile {
	String username;
	String firstname;
	String lastname;
	String email;
	String password;
	
	public Profile(String firstname,String lastname,String username,String email,String password)
	{
		this.firstname=firstname;
		this.lastname=lastname;
		this.email=email;
		this.password=password;
		this.username=username;
	}
}
//	class Poststore{
//		String usernmme;
//		String post;
//		String topic;
//		String datetime;
//		
//		public Poststore(String username,String post, String topic, String datetime)
//		{
//			this.usernmme = username;
//			this.post = post;
//			this.topic = topic;
//			this.datetime = datetime;
//		}
//}

