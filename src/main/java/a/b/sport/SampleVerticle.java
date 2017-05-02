package a.b.sport;
import com.nhncorp.mods.socket.io.SocketIOServer;
import com.nhncorp.mods.socket.io.SocketIOSocket;
import com.nhncorp.mods.socket.io.impl.DefaultSocketIOServer;
import com.nhncorp.mods.socket.io.spring.DefaultEmbeddableVerticle;

import a.b.sport.dao.ChatLogDAO;
import a.b.sport.service.TeamService;
import a.b.sport.vo.ChatLogVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.vertx.java.core.Handler;
import org.vertx.java.core.http.HttpServer;
import org.vertx.java.core.json.JsonObject;
import org.vertx.java.core.Vertx;


/**
 * @author Keesun Baik
 */
public class SampleVerticle extends  DefaultEmbeddableVerticle  {
	private static SocketIOServer io = null;
	@Override
	public void start(Vertx vertx) {
		int port = 11114;
		
		HttpServer server = vertx.createHttpServer();

		io = new DefaultSocketIOServer(vertx, server);

		io.sockets().onConnection(new Handler<SocketIOSocket>() {

			public void handle(final SocketIOSocket socket) {
			
				socket.on("msg", new Handler<JsonObject>() {
					public void handle(JsonObject event) {
						System.out.println(event);
						System.out.println("handler ::: " + event.getString("content"));
						String teamnum = event.getInteger("teamnum").toString();
						io.sockets().emit(teamnum,event);
					
					}

				});
				

			}
			

		});
		
		server.listen(port);

	}


}