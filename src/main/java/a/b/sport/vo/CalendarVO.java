package a.b.sport.vo;

public class CalendarVO {
	  public int id;
	    public String title;
	    public String start;
	    public String end;
	    public String color;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getStart() {
			return start;
		}
		public void setStart(String start) {
			this.start = start;
		}
		public String getEnd() {
			return end;
		}
		public void setEnd(String end) {
			this.end = end;
		}
		public String getColor() {
			return color;
		}
		public void setColor(String color) {
			this.color = color;
		}
		@Override
		public String toString() {
			return "CalendarVO [id=" + id + ", title=" + title + ", start=" + start + ", end=" + end + ", color="
					+ color + "]";
		}
	    
}
