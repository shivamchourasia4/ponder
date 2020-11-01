package servlets;
public class Poststore{
		String username;
		String post;
		String topic;
		String datetime;
		
		public Poststore(String username,String post, String topic, String datetime)
		{
			this.username = username;
			this.post = post;
			this.topic = topic;
			this.datetime = datetime;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getPost() {
			return post;
		}

		public void setPost(String post) {
			this.post = post;
		}

		public String getTopic() {
			return topic;
		}

		public void setTopic(String topic) {
			this.topic = topic;
		}

		public String getDatetime() {
			return datetime;
		}

		public void setDatetime(String datetime) {
			this.datetime = datetime;
		}
		
	

}
