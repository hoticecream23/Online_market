CREATE TABLE `brands` (
	`brand_id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(100) NOT NULL,
	`discounts` decimal(5,2) DEFAULT '0.00',
	CONSTRAINT `brands_brand_id` PRIMARY KEY(`brand_id`),
	CONSTRAINT `brands_name_unique` UNIQUE(`name`)
);
--> statement-breakpoint
CREATE TABLE `customers` (
	`customer_id` int AUTO_INCREMENT NOT NULL,
	`first_name` varchar(50) NOT NULL,
	`middle_name` varchar(50),
	`last_name` varchar(50) NOT NULL,
	`email` varchar(100) NOT NULL,
	`phone` varchar(20),
	`address` varchar(255),
	CONSTRAINT `customers_customer_id` PRIMARY KEY(`customer_id`),
	CONSTRAINT `customers_email_unique` UNIQUE(`email`)
);
--> statement-breakpoint
CREATE TABLE `employees` (
	`employee_id` int AUTO_INCREMENT NOT NULL,
	`first_name` varchar(50) NOT NULL,
	`last_name` varchar(50) NOT NULL,
	`designation` varchar(100),
	`hire_date` timestamp,
	CONSTRAINT `employees_employee_id` PRIMARY KEY(`employee_id`)
);
--> statement-breakpoint
CREATE TABLE `order_details` (
	`order_detail_id` int AUTO_INCREMENT NOT NULL,
	`order_id` int,
	`product_id` int,
	`quantity` int NOT NULL,
	`price_per_unit` decimal(10,2) NOT NULL,
	CONSTRAINT `order_details_order_detail_id` PRIMARY KEY(`order_detail_id`)
);
--> statement-breakpoint
CREATE TABLE `orders` (
	`order_id` int AUTO_INCREMENT NOT NULL,
	`order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
	`customer_id` int,
	CONSTRAINT `orders_order_id` PRIMARY KEY(`order_id`)
);
--> statement-breakpoint
CREATE TABLE `payments` (
	`transaction_id` int AUTO_INCREMENT NOT NULL,
	`order_id` int,
	`amount` decimal(10,2) NOT NULL,
	`payment_mode` varchar(50),
	`status` varchar(50),
	`payment_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT `payments_transaction_id` PRIMARY KEY(`transaction_id`)
);
--> statement-breakpoint
CREATE TABLE `product_suppliers` (
	`product_id` int NOT NULL,
	`supplier_id` int NOT NULL,
	CONSTRAINT `product_suppliers_product_id_supplier_id_pk` PRIMARY KEY(`product_id`,`supplier_id`)
);
--> statement-breakpoint
CREATE TABLE `products` (
	`product_id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`price` decimal(10,2) NOT NULL,
	`stock` int NOT NULL,
	`brand_id` int,
	CONSTRAINT `products_product_id` PRIMARY KEY(`product_id`)
);
--> statement-breakpoint
CREATE TABLE `suppliers` (
	`supplier_id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(100) NOT NULL,
	`contact_email` varchar(100),
	`contact_phone` varchar(20),
	CONSTRAINT `suppliers_supplier_id` PRIMARY KEY(`supplier_id`),
	CONSTRAINT `suppliers_contact_email_unique` UNIQUE(`contact_email`)
);
--> statement-breakpoint
ALTER TABLE `order_details` ADD CONSTRAINT `order_details_order_id_orders_order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `order_details` ADD CONSTRAINT `order_details_product_id_products_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `orders` ADD CONSTRAINT `orders_customer_id_customers_customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `payments` ADD CONSTRAINT `payments_order_id_orders_order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `product_suppliers` ADD CONSTRAINT `product_suppliers_product_id_products_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `product_suppliers` ADD CONSTRAINT `product_suppliers_supplier_id_suppliers_supplier_id_fk` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers`(`supplier_id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `products` ADD CONSTRAINT `products_brand_id_brands_brand_id_fk` FOREIGN KEY (`brand_id`) REFERENCES `brands`(`brand_id`) ON DELETE no action ON UPDATE no action;