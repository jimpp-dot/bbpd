package ly.plugins.pulse_log;

import androidx.lifecycle.MutableLiveData;

import java.util.HashMap;
import java.util.Map;

public class LiveDataBus {

    public static MutableLiveData<Object> getInstance(String action){
        return ready().with(action);
    }

    private final Map<String,MutableLiveData<Object>> bus;

    private LiveDataBus(){
        bus = new HashMap<>();
    }

    private static class InstanceHolder{
        static final LiveDataBus INSTANCE = new LiveDataBus();
    }

    private static LiveDataBus ready(){
        return InstanceHolder.INSTANCE;
    }

    private MutableLiveData<Object> with(String key){
        if(!bus.containsKey(key)){
            MutableLiveData<Object> liveData = new MutableLiveData<>();
            bus.put(key,liveData);
        }
        return bus.get(key);
    }

}