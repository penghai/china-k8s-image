

elk=docker.elastic.co/elasticsearch/elasticsearch:7.13.4,docker.elastic.co/beats/filebeat:7.13.4-arm64,docker.elastic.co/beats/journalbeat:7.13.4-arm64,docker.elastic.co/beats/metricbeat:7.13.4-arm64,docker.elastic.co/kibana/kibana:7.13.4-arm64

IFS=","
for i in $elk
do
#    echo $i
    image_name=$(echo $i|awk -F : '{print $1}'|awk -F / '{print $NF}')
#    echo $image_name
    mkdir -p $image_name
    echo "FROM $i" > $image_name/Dockerfile
done
