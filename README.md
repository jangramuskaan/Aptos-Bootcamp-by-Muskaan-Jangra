# Aptos-Bootcamp-by-Muskaan-Jangra
0xddeb7c9df3039d107579ab3dea5eb71a00e3c1fe6ee68ef940f2b6412fb31bd3
# Peer Recognition Platform with NFTs

A decentralized peer recognition platform built on Aptos blockchain that rewards meaningful contributions with NFT certificates.

## Overview

This Move smart contract enables organizations and communities to create a gamified recognition system where peers can acknowledge each other's contributions and achievements. Each recognition is immortalized as a unique NFT that serves as a permanent, tradeable certificate of achievement.

## Features

- **Peer-to-Peer Recognition**: Users can recognize colleagues, teammates, or community members
- **NFT Rewards**: Each recognition generates a unique NFT certificate
- **Category System**: Organize recognitions by type (Leadership, Innovation, Teamwork, etc.)
- **Personal Messages**: Add custom messages to make recognitions more meaningful
- **User Profiles**: Track recognition statistics and NFT collections
- **Timestamp Records**: All recognitions are timestamped for authenticity

## Smart Contract Functions

### `give_recognition()`
Allows users to recognize a peer and mint an NFT reward.

**Parameters:**
- `recognizer: &signer` - The person giving recognition
- `recipient_address: address` - Address of the person being recognized
- `category: String` - Type of recognition (e.g., "Leadership", "Innovation")
- `message: String` - Personal recognition message
- `nft_id: u64` - Unique identifier for the NFT

### `create_profile()`
Initializes a user's recognition profile.

**Parameters:**
- `user: &signer` - The user creating their profile

## Data Structures

### RecognitionNFT
```move
struct RecognitionNFT {
    recipient: address,        // Who received the recognition
    recognizer: address,       // Who gave the recognition
    category: String,          // Recognition category
    message: String,           // Personal message
    timestamp: u64,            // When recognition was given
    nft_id: u64,              // Unique NFT identifier
}
```

### RecognitionProfile
```move
struct RecognitionProfile {
    total_received: u64,       // Total recognitions received
    total_given: u64,         // Total recognitions given
    nft_collection: vector<u64>, // Owned NFT IDs
}
```

## Usage Example

```move
// 1. Create your profile
create_profile(user_signer);

// 2. Give recognition to a peer
give_recognition(
    recognizer_signer,
    recipient_address,
    string::utf8(b"Innovation"),
    string::utf8(b"Outstanding work on the blockchain integration project!"),
    12345
);
```

## Deployment

1. Compile the Move contract:
```bash
aptos move compile
```

2. Deploy to Aptos network:
```bash
aptos move publish
```

## Use Cases

- **Corporate Recognition Programs**: Employee appreciation and peer nominations
- **Educational Institutions**: Student and teacher recognition systems
- **Open Source Communities**: Contributor acknowledgment and rewards
- **Gaming Communities**: Achievement and milestone celebrations
- **Professional Networks**: Skill endorsements and project contributions

## Benefits

- **Transparency**: All recognitions are recorded on-chain
- **Permanence**: NFT certificates cannot be lost or deleted
- **Gamification**: Encourages positive behavior through rewards
- **Portability**: NFTs can be displayed across platforms
- **Analytics**: Track recognition patterns and engagement

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is open source and available under the MIT License.

## Contact

For questions, suggestions, or support, please open an issue or contact the development team.

---

*Built with ❤️ on Aptos blockchain*
