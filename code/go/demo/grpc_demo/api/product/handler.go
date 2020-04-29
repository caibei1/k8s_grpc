package main

import (
	pb "github.com/caibei1/k8s_grpc/code/go/demo/grpc_demo/api/product/pb"
	"golang.org/x/net/context"
	"google.golang.org/grpc"
	"log"
	"time"
)

const (
	address = "localhost:5230"
)

func main()  {
	// 建立一个与服务端的连接.
	conn, err := grpc.Dial(address, grpc.WithInsecure())
	if err != nil {
		log.Fatalf("连接失败, err: %v", err)
	}
	defer conn.Close()
	client := pb.NewProductServiceClient(conn)

	ctx, cancel := context.WithTimeout(context.Background(), time.Second)

	response,err := client.AddProduct(ctx,&pb.AddProductRequest{ProductName: "phone"})
	if nil != err {
		log.Fatalf("新增产品失败, err: %v",err)
	}
	log.Printf("新增产品成功,%s",response)
	productId:=response.ProductId
	queryResp,err :=client.QueryProductInfo(ctx,&pb.QueryProductRequest{ProductId: productId})
	if nil !=err {
		log.Fatalf("查询产品信息失败, err: %v",err)
	}
	log.Printf("产品信息: %v",queryResp)

	defer cancel()
}