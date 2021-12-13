import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import java.util.StringTokenizer; 
import java.lang.*;

public class CleanMapper extends Mapper<LongWritable, Text, Text, Text> 
{ 
    private Text word = new Text();

    @Override
    public void map(LongWritable key, Text value, Context context)
    throws IOException, InterruptedException 
    {
        String line = value.toString();
        String[] linePart = line.split("\t");
        String propertyKey = linePart[0]; 
        String propertyName = linePart[1];
        String address = linePart[8];
        String city = linePart[9];
        String postCode = linePart[10];
        String propertyType = linePart[11];
        String energyStarScore = linePart[26];
        String energyStarCertification = linePart[31];
        String fuelOil1 = linePart[45];
        String fuelOil2 = linePart[46];
        String fuelOil4 = linePart[47];
        String diessel2use = linePart[48];
        String propaneUse = linePart[49];
        String districtSteamUse = linePart[50];
        String hotWaterUse = linePart[51];
        String naturalGasUse = linePart[54];
        if(propertyName.equals("Property Name"))
        {
            context.write(new Text(" "), new Text(propertyKey + "\t" + propertyName + "\t" +  address + "\t" + city + "\t" + postCode + "\t" + propertyType + "\t" + energyStarScore + "\t" + energyStarCertification + "\t" +  fuelOil1 +  "\t" + fuelOil2 + "\t"  + fuelOil4  + "\t" +diessel2use + "\t"  +  districtSteamUse + "\t"  + hotWaterUse + "\t" + naturalGasUse));

        }
        context.write(new Text(" "), new Text(propertyKey + "\t" + propertyName + "\t" +  address + "\t" + city + "\t" + postCode + "\t" + propertyType + "\t" + energyStarScore + "\t" + energyStarCertification + "\t" +  fuelOil1 +  "\t" + fuelOil2 + "\t"  + fuelOil4  + "\t" +diessel2use + "\t"  +  districtSteamUse + "\t"  + hotWaterUse + "\t" + naturalGasUse));
        
    }
}