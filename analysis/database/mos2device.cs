// https://www.codeproject.com/Articles/34527/MOS-Protocol-Fundamentals
//<mos> message
using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace mosprotocol
{
   [XmlRoot("mos")]
   public class cMOS
    {
        string _mosID, _ncsID;
        long _messageID;
        cHeartBeat _heartbeat;

        public string mosID
        {
            get {return _mosID; }
            set { _mosID = value; }
        }

        public string ncsID
        {
            get { return _ncsID; }
            set { _ncsID = value; }
        }

        public long messageID
        {
            get { return _messageID; }
            set { _messageID = value; }
        }

       public cHeartBeat heartbeat
        {
            get { return _heartbeat; }
            set { _heartbeat = value; }
        }
    }
}

//heartbeat message
namespace mosprotocol
{
    [XmlRoot("heartbeat")]
    public class cHeartBeat
    {
        DateTime _time;

        public DateTime time
        {
            get { return _time; }
            set { _time = value; }
        }
    }
}

HeartBeat heartbeat = new cHeartBeat();
heartbeat.time = DateTime.Now;

//create MOS message and set its heartbeat property
cMOS mos = new cMOS();
mos.messageID = 333;
mos.mosID = "MOSDEVICEID";
mos.ncsID = "NCSID";
mos.heartbeat = heartbeat;

//serialize MOS object
MemoryStream ms = new MemoryStream();
XmlSerializer xml = new XmlSerializer(typeof(cMOS));
xml.Serialize(ms, mos);

//create TCP connection with MOS device
TcpClient mosClient = new TcpClient("10.1.0.94", 10641);
         
//write MOS object stream to MOS device
mosClient.GetStream().Write(ms.GetBuffer(),0,ms.GetBuffer().Length);
