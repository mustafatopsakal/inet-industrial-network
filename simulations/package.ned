package inet_industrial_network.simulations;

import inet.networks.base.TsnNetworkBase;
import inet.node.contract.IEthernetNetworkNode;
import inet.node.ethernet.Eth1G;
import inet.node.mpls.LdpMplsRouter;
import inet.node.tsn.TsnClock;
import inet.node.tsn.TsnDevice;
import inet.node.tsn.TsnSwitch;
import inet.showcases.tsn.gatescheduling.TsnSwitch1;

network industrial_network extends TsnNetworkBase
{
    submodules:
        N1: TsnDevice {
            @display("p=300,400");
        }
        N2: TsnDevice {
            @display("p=500,500");
        }
        N3: TsnDevice {
            @display("p=500,300");
        }
        N4: TsnDevice {
            @display("p=600,300");
        }
        N5: TsnDevice {
            @display("p=700,500");
        }
        N6: TsnDevice {
            @display("p=900,500");
        }
        N7: TsnDevice {
            @display("p=800,300");
        }
        N8: TsnDevice {
            @display("p=1000,400");
        }
        SW1: TsnSwitch {
            @display("p=400,400");
        }
        SW2: TsnSwitch {
            @display("p=500,400");
        }
        SW3: TsnSwitch {
            @display("p=600,400");
        }
        SW4: TsnSwitch {
            @display("p=700,400");
        }
        SW5: TsnSwitch {
            @display("p=800,400");
        }
        SW6: TsnSwitch {
            @display("p=900,400");
        }
        masterClock: <> like IEthernetNetworkNode if typename != "" {
            @display("p=1000,100;i=device/card");
        }

    connections:

        SW1.ethg++ <--> Eth1G <--> SW2.ethg++;
        SW2.ethg++ <--> Eth1G <--> SW3.ethg++;
        SW3.ethg++ <--> Eth1G <--> SW4.ethg++;
        SW4.ethg++ <--> Eth1G <--> SW5.ethg++;
        SW5.ethg++ <--> Eth1G <--> SW6.ethg++;
        N1.ethg++ <--> Eth1G <--> SW1.ethg++;
        N2.ethg++ <--> Eth1G <--> SW2.ethg++;
        N3.ethg++ <--> Eth1G <--> SW2.ethg++;
        N4.ethg++ <--> Eth1G <--> SW3.ethg++;
        N5.ethg++ <--> Eth1G <--> SW4.ethg++;
        N7.ethg++ <--> Eth1G <--> SW5.ethg++;
        N6.ethg++ <--> Eth1G <--> SW6.ethg++;
        N8.ethg++ <--> Eth1G <--> SW6.ethg++;                                      
}
